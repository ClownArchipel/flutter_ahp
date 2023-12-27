import 'dart:async';

import 'package:ahp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/rekomendasi_pilihan_view.dart';

class RekomendasiPilihanController extends GetxController {
  RekomendasiPilihanView? view;
  RxString rekom = ''.obs;
  RxBool isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetch() async {
    isloading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().rekomendasi();
        rekom.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info", content: Text(error.toString()));
      }
      isloading.value = false;
    });
  }
}
