import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/master_kost_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MasterKostView extends StatelessWidget {
  const MasterKostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat priceFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return GetBuilder<MasterKostController>(
      init: MasterKostController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Master Kost",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () => controller.fetchKosts(),
                    icon: const Icon(Icons.refresh))
              ],
              iconTheme: const IconThemeData(
                color: Colors.white, // Ganti warna tombol drawer di sini
              ),
              backgroundColor: MyColor.mainCol,
            ),
            drawer: const MyDrawer(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                controller.wantToAdd();
              },
            ),
            body: Obx(() {
              if (controller.kostList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                    child: SizedBox(
                        height: 0.8.sh,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              child: DataTable2(
                                columnSpacing: 2,
                                horizontalMargin: 10,
                                fixedLeftColumns: 1,
                                headingRowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                }),
                                headingTextStyle:
                                    const TextStyle(color: Colors.white),
                                minWidth: 950,
                                columns: const [
                                  DataColumn2(
                                      label: Text('No.'), fixedWidth: 40),
                                  DataColumn2(
                                    label: Text('Name'),
                                    fixedWidth: 150,
                                  ),
                                  DataColumn2(
                                    label: Text('Address'),
                                    fixedWidth: 250,
                                  ),
                                  DataColumn2(
                                    label: Text('Harga'),
                                    fixedWidth: 100,
                                  ),
                                  DataColumn2(
                                    label: Text('Ukuran'),
                                    fixedWidth: 80,
                                  ),
                                  DataColumn2(
                                    label: Text('Fasilitas'),
                                  ),
                                  DataColumn2(
                                    label: Text('Rating'),
                                  ),
                                  DataColumn2(
                                    label: Text('Action'),
                                  ),
                                ],
                                rows: controller.kostList
                                    .map(
                                      (kost) => DataRow(
                                        cells: [
                                          DataCell(Text(kost['id'].toString())),
                                          DataCell(Text(kost['name'])),
                                          DataCell(Text(kost['address'])),
                                          DataCell(Text(
                                              'Rp.${priceFormatter.format(double.parse(kost['price']))}')),
                                          DataCell(Text(kost['facility']
                                              .toString())),
                                          DataCell(Text(
                                              kost['room_size'].toString())),
                                          DataCell(Text(kost['rating'])),
                                          DataCell(Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .wantToEdit(kost['id']);
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  )),
                                              IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .deleteKost(kost['id']);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
                                            ],
                                          ))
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        )));
              }
            }));
      },
    );
  }
}
