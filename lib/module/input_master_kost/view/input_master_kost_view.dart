import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../controller/input_master_kost_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';

class InputMasterKostView extends StatelessWidget {
  const InputMasterKostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final NumberFormat priceFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return GetBuilder<InputMasterKostController>(
      init: InputMasterKostController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Input Master Kost",
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(
              color: Colors.white, // Ganti warna tombol drawer di sini
            ),
            backgroundColor: MyColor.mainCol,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () {
              controller.data[0]["create"] == "true"
                  ? controller.create()
                  : controller.updateKost();
            },
          ),
          body: SingleChildScrollView(child: Obx(() {
            if (controller.data[0]["create"] == "false") {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 50,
                        decoration:  InputDecoration(
                          labelText: controller.name.value.toString(),
                          labelStyle:const TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          controller.name.value = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 250,                       
                        decoration: InputDecoration(
                          labelText: controller.address.value,
                          labelStyle:const  TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder:const  UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          controller.address.value = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 20,
                        autofocus: true,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}$')),
                        ],
                        decoration:  InputDecoration(
                          labelText: priceFormatter.format(double.parse(controller.price.value.toString())),
                          labelStyle:const TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty ?controller.price.value = 0.0:controller.price.value = double.parse(value);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'Facility : ${controller.facility.value}',
                          labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder:const  UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty? controller.facility.value=0:controller.facility.value = int.parse(value);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'Room Size: ${controller.sizeRoom.value}',
                          labelStyle:const TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty? controller.sizeRoom.value=0:controller.sizeRoom.value = int.parse(value);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}$')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Rating : ${controller.rating.value}',
                          labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder:const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty? controller.rating.value=0.0:controller.rating.value = double.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 50,
                        initialValue: controller.name.value,
                        decoration: const InputDecoration(
                          labelText: 'Nama kost',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          controller.name.value = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 250,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          controller.address.value = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 20,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}$')),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Price (Rp.)',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                         value.isEmpty?controller.price.value=0 : controller.price.value = double.parse(value);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Facility',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty? controller.facility.value=0:controller.facility.value = int.parse(value);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Room Size',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty? controller.sizeRoom.value=0:controller.sizeRoom.value = int.parse(value);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}$')),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Rating',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          value.isEmpty? controller.rating.value=0.0:controller.rating.value = double.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          })),
        );
      },
    );
  }
}
