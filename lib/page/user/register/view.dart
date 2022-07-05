import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/res/z_res.dart';
import 'package:flutter_wan/common/widget/base_scaffold.dart';
import 'package:get/get.dart';

import 'logic.dart';

class RegisterPage extends GetView<RegisterLogic> {
  @override
  Widget build(BuildContext context) {
    return commonScaffold(
        title: StringRes.register.tr,
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            children: [
              space(height: 60.h),
              _buildUsername(),
              space(height: 5.h),
              _buildPassword(),
              space(height: 5.h),
              _buildPasswordAgain(),
              space(height: 5.h),
              _buildRegisterButton(),
            ],
          ),
        ));
  }

  _buildUsername() {
    return TextField(
      controller: controller.usernameController,
      maxLength: 26,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(label: Text(StringRes.username.tr)),
    );
  }

  _buildPassword() {
    return TextField(
      controller: controller.passwordController,
      maxLength: 26,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(label: Text(StringRes.password.tr)),
    );
  }

  _buildPasswordAgain() {
    return TextField(
      controller: controller.passwordAgainController,
      maxLength: 26,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(label: Text(StringRes.password.tr)),
    );
  }

  _buildRegisterButton() {
    return GestureDetector(
      onTap: () => controller.register(),
      child: Container(
        width: ScreenUtil.defaultSize.width,
        margin: EdgeInsets.only(left: 10.w, top: 30.h, right: 10.w),
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.r)),
            color: Colors.purple[400]),
        child: Center(
          child: Text(
            StringRes.register.tr,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
