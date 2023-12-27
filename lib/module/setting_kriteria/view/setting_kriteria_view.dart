import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controller/setting_kriteria_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';

class SettingKriteriaView extends StatelessWidget {
  const SettingKriteriaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingKriteriaController>(
      init: SettingKriteriaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Setting Kriteria",
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white, // Ganti warna tombol drawer di sini
              ),
              actions: [
                IconButton(
                    onPressed: () => controller.fetchData(),
                    icon: const Icon(Icons.refresh))
              ],
              backgroundColor: MyColor.mainCol,
            ),
            drawer: const MyDrawer(),
            body: Obx(() {
              if (controller.data.value.id == 0 || controller.loading == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Card(
                            color: Colors.grey[400],
                            child: Container(
                              margin: const EdgeInsets.all(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('K1: ${controller.data.value.k1}'),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.grey[400]!,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            maxLength: 1,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration:
                                                const InputDecoration.collapsed(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              hintText: ".....",
                                            ),
                                            onChanged: (value) {
                                              value.isEmpty
                                                  ? controller.data.value.k1 = 0.toString()
                                                  : controller.data.value.k1 =
                                                      value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text('K2: ${controller.data.value.k2}'),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.grey[400]!,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            maxLength: 1,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration:
                                                const InputDecoration.collapsed(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              hintText: ".....",
                                            ),
                                            onChanged: (value) {
                                              value.isEmpty
                                                  ? controller.data.value.k2 = 0.toString()
                                                  : controller.data.value.k2 =
                                                      value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text('K3: ${controller.data.value.k3}'),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.grey[400]!,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            maxLength: 1,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration:
                                                const InputDecoration.collapsed(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              hintText: ".....",
                                            ),
                                            onChanged: (value) {
                                              value.isEmpty
                                                  ? controller.data.value.k3 = 0.toString()
                                                  : controller.data.value.k3 =
                                                      value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text('K4: ${controller.data.value.k4}'),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.grey[400]!,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            maxLength: 1,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration:
                                                const InputDecoration.collapsed(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              hintText: ".....",
                                            ),
                                            onChanged: (value) {
                                              value.isEmpty
                                                  ? controller.data.value.k4 = 0.toString()
                                                  : controller.data.value.k4 =
                                                      value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton.icon(
                                        icon: const Icon(
                                          Icons.save,
                                          color: Colors.white,
                                        ),
                                        label: const Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.updateSetKriteria();
                                        },
                                      ),
                                      ElevatedButton.icon(
                                        icon: const Icon(
                                          Icons.restore,
                                          color: Colors.black,
                                        ),
                                        label: const Text(
                                          "Reset",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellow,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.resetSetKriteria();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }));
      },
    );
  }
}
