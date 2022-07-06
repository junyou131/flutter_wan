import 'package:flutter_wan/common/model/project_item_model.dart';
import 'package:flutter_wan/common/model/project_model.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/provider/common_provider.dart';

class ProjectLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  late RefreshController refreshController;
  RxList<ProjectInfo> projectList = RxList<ProjectInfo>();
  RxList<Project> projects = RxList<Project>();

  var page = 1;

  /// 选中项目
  var chooseIndex = RxInt(-1);
  var chooseCid = -1;

  @override
  onInit() {
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  onReady() {
    getProjects();
    super.onReady();
  }

  getProjects() async {
    var response = await provider.getProjects();
    projectList.value.addAll(ProjectModel.fromJson(response.body).data);
    chooseIndex.value = 0;
    chooseCid = projectList.value[0].id;
    getProjectList();
  }

  /// 切换项目tab
  changeIndex(int cid) {
    if (cid == chooseCid) return;
    var size = projectList.length;
    for (var i = 0; i < size; i++) {
      var cCid = projectList[i].id;
      if (cCid == cid) {
        chooseCid = cid;
        chooseIndex.value = i;
        break;
      }
    }
    onRefresh();
  }

  getProjectList() async {
    var response = await provider.getProjectList(page, chooseCid.toString());
    if (page == 1) {
      projects.clear();
    }
    projects.addAll(ProjectItemModel.fromJson(response.body).data.datas);
    if (refreshController.isLoading) {
      refreshController.loadComplete();
      if (projects.length % 10 != 0) {
        refreshController.loadNoData();
      }
    } else if (refreshController.isRefresh) {
      refreshController.refreshCompleted(
        resetFooterState: true,
      );
    }
  }

  onRefresh() {
    page = 1;
    getProjectList();
  }

  onLoading() {
    page++;
    getProjectList();
  }
}
