import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/input_master_kost_view.dart';
import 'package:ahp/service/api.dart';

class InputMasterKostController extends GetxController {
  InputMasterKostView? view;
  var data = Get.arguments;
  RxString name = ''.obs;
  RxString address = ''.obs;
  RxDouble price = 0.0.obs;
  RxInt facility = 0.obs;
  RxInt sizeRoom = 0.obs;
  RxDouble rating = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void create() async {
    var formData = {
      "name": name.value,
      "address": address.value,
      "price": price.value,
      "facility": facility.value,
      "sizeRoom": sizeRoom.value,
      "rating": rating.value
    };
    var res = await ApiService().createKost(formData);
    Get.defaultDialog(title: "Info", content: Text(res),onConfirm: ()=>Get.offAllNamed('/master-kost'));
  }

  void updateKost() async {
    var formData = {
      "name": name.value,
      "address": address.value,
      "price": price.value,
      "facility": facility.value,
      "sizeRoom": sizeRoom.value,
      "rating": rating.value
    };
    // print(data[1]["id"]);
    var res = await ApiService().updateKost(formData,data[1]["id"]);
    Get.defaultDialog(title: "Info", content: Text(res),onConfirm: ()=>Get.offAllNamed('/master-kost'));
  }

  Future loadData() async {
    if (data[0]["create"] == "false") {
      try {
        var response = await ApiService().getOneKost(data[1]["id"]);
        if (response.id.isNaN) {
          Get.defaultDialog(title: "Data Not Found");
        } else {
          name.value = response.name;
          address.value = response.address;
          price.value = double.parse(response.price);
          facility.value = response.facility;
          sizeRoom.value = response.roomSize;
          rating.value = double.parse(response.rating);
        }
      } catch (error) {
        rethrow;
      }
    }
  }
}
