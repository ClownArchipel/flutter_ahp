
import 'dart:async';

import 'package:ahp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/perhitungan_view.dart';

class PerhitunganController extends GetxController {
  PerhitunganView? view;
  var perhitunganList = <dynamic>[].obs;
  var perhiList = <dynamic>[].obs;
  var eigenList = <dynamic>[].obs;
  var konstantaList = <dynamic>[].obs;
  var jmlnilaiList = <dynamic>[].obs;
  var prioritasList = <dynamic>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void load(){
    fetch();
    fetch2();
    fetch3();
    fetch4();
    fetch5();
    fetch6();
  }

   Future<void> fetch() async {
    isLoading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getDataPerhitungan();
        perhitunganList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
      isLoading.value = false;
    });
  }

  Future<void> fetch2() async {
    isLoading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getPerbandingan();
        perhiList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
      isLoading.value = false;
    });
  }

  Future<void> fetch3() async {
    isLoading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getHasilPerbandingan();
        jmlnilaiList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
      isLoading.value = false;
    });
  }

  Future<void> fetch4() async {
    isLoading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getEigen();
        eigenList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
      isLoading.value = false;
    });
  }

  Future<void> fetch5() async {
    isLoading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getKonstanta();
        konstantaList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
      isLoading.value = false;
    });
  }

  Future<void> fetch6() async {
    isLoading.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getPrioritas();
        prioritasList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
      isLoading.value = false;
    });
  }
}
    