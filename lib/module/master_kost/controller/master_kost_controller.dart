import 'dart:async';

import 'package:ahp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/master_kost_view.dart';

class MasterKostController extends GetxController {
  MasterKostView? view;
  var kostList = <dynamic>[].obs;

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
    kostList.value = [];
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getKosts();
        kostList.value = response;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
    });
  }

  Future<void> deleteKost(int id) async {
    try {
      var response = await ApiService().deleteKost(id);
      if (response == "success delete") {
        fetchKosts();
        Get.defaultDialog(title: 'Success', content: Text(response));
      }
    } catch (error) {
      Get.defaultDialog(title: "Info",content: Text(error.toString()));
    }
  }

  void wantToAdd() {
    Get.toNamed('/master-kost/input', arguments: [
      {"create": 'true'},
    ]);
  }

  void wantToEdit(id) {
    Get.toNamed('/master-kost/input', arguments: [
      {"create": 'false'},
      {"id": id}
    ]);
  }
}
