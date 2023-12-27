
import 'dart:async';
import 'dart:ffi';

import 'package:ahp/model/setkriteria.dart';
import 'package:ahp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/setting_kriteria_view.dart';

class SettingKriteriaController extends GetxController {
  SettingKriteriaView? view;
  Rx<SetKriteria> data = SetKriteria(id: 0,k1: '',k2: '',k3: '',k4: '').obs;
  bool loading = true;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchData() async {
    Timer(const Duration(seconds: 1), () async {
      try {
        var response = await ApiService().getSetKriteria();
        print(response);
        data.value = response;
        loading = false;
      } catch (error) {
        Get.defaultDialog(title: "Info",content: Text(error.toString()));
      }
    });
  }

  void updateSetKriteria() async {
    var formData = {
      "k1": data.value.k1,
      "k2": data.value.k2,
      "k3": data.value.k3,
      "k4": data.value.k4,
    };
    // print(data[1]["id"]);
    var res = await ApiService().updateSetKriteria(formData);
    fetchData();
    Get.defaultDialog(title: "Info", content: Text(res),onConfirm: ()=>Get.offAllNamed('/setting-kriteria'));
  }

  void resetSetKriteria() async {
    var formData = {
      "k1": 1,
      "k2": 5,
      "k3": 3,
      "k4": 2,
    };
    // print(data[1]["id"]);
    var res = await ApiService().updateSetKriteria(formData);
    fetchData();
    Get.defaultDialog(title: "Info", content: Text(res),onConfirm: ()=>Get.offAllNamed('/setting-kriteria'));
  }
}
    