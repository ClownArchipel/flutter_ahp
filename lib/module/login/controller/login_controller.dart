import 'package:ahp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../view/login_view.dart';

class LoginController extends GetxController {
  LoginView? view;
  var username = ''.obs;
  var password = ''.obs;
  RxBool isObscured = RxBool(true);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() {
    if (username.value == 'admin' && password.value == 'admin') {
      Get.offNamed('/dashboard');
    } else {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.w),
        contentPadding: EdgeInsets.symmetric(vertical: 10.w),
        title: "Alert",
        content: const Text('Username dan password tidak sesuai'),
        textConfirm: 'ok',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
}
