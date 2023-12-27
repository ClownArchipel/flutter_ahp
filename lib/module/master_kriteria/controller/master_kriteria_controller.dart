
import 'dart:async';

import 'package:ahp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/master_kriteria_view.dart';

class MasterKriteriaController extends GetxController {
  MasterKriteriaView? view;
  var kriteriaList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchKosts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchKosts() async {
    kriteriaList.value = [];
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getKriteria();
        kriteriaList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
    });
  }
}
    