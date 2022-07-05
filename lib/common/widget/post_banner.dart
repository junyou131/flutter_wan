import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:flutter_wan/common/utils/image_utils.dart';
import '../model/post_banner.dart';

class PostBanner extends StatelessWidget {
  List<BannerModel> bannerList;
  double bannerHeight;
  EdgeInsets? padding;

  PostBanner({required this.bannerList, Key? key, this.bannerHeight = 160, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bannerHeight,
      child: _banner(),
    );
  }

  _banner() {
    return Swiper(
      key: UniqueKey(),
      autoplay: true,
      itemCount: bannerList.length,
      itemBuilder: (BuildContext context, int index) {
        return _item(bannerList[index]);
      },
      pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(
              color: Colors.white60, size: 6, activeSize: 6)),
    );
  }

  _item(BannerModel item) {
    return InkWell(
      onTap: () => {AppRoutes.toUrl(item.url)},
      child: Container(
        padding: padding,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(6)).r,
          child: cachedImage(item.imagePath),
        ),
      ),
    );
  }
}
