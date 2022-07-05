import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/res/z_res.dart';
import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:flutter_wan/common/widget/base_scaffold.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends GetView<LoginLogic> {
  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      title: StringRes.login.tr,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            _buildInputUsername(),
            SizedBox(
              height: 5.h,
            ),
            _buildInputPassword(),
            SizedBox(
              height: 15.h,
            ),
            _buildLoginButton(),
            SizedBox(
              height: 10.h,
            ),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  _buildInputUsername() {
    return TextField(
      controller: controller.usernameController,
      maxLength: 26,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(label: Text(StringRes.username.tr)),
    );
  }

  _buildInputPassword() {
    return TextField(
      controller: controller.passwordController,
      maxLength: 26,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(label: Text(StringRes.password.tr)),
    );
  }

  _buildLoginButton() {
    return GestureDetector(
      onTap: () => controller.login(),
      child: Container(
        width: ScreenUtil.defaultSize.width,
        margin: EdgeInsets.only(left: 10.w, top: 30.h, right: 10.w),
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.r)),
            color: Colors.purple[400]),
        child: Center(
          child: Text(
            StringRes.login.tr,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }

  _buildRegisterButton() {
    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
          onPressed: () => AppRoutes.toRegister(),
          child: Text(
            StringRes.toRegister.tr,
            style: TextStyle(color: Colors.purple[300]),
          )),
    );
  }
}
