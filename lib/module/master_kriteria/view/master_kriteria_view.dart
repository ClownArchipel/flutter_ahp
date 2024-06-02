import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/master_kriteria_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MasterKriteriaView extends StatelessWidget {
  const MasterKriteriaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat priceFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return GetBuilder<MasterKriteriaController>(
      init: MasterKriteriaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Master Kriteria",
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white, // Ganti warna tombol drawer di sini
              ),
              backgroundColor: MyColor.mainCol,
            ),
            drawer: const MyDrawer(),
            // floatingActionButton: FloatingActionButton(
            //   child: const Icon(Icons.add),
            //   onPressed: () {
            //     //
            //   },
            // ),
            body: Obx(() {
              if (controller.kriteriaList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
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
                                headingRowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                }),
                                headingTextStyle:
                                    const TextStyle(color: Colors.white),
                                horizontalMargin: 10,
                                fixedLeftColumns: 1,
                                minWidth: 1000,
                                columns: const [
                                  DataColumn2(
                                      label: Text('No.'), fixedWidth: 30),
                                  DataColumn2(
                                    label: Text('Name'),
                                    fixedWidth: 150,
                                  ),
                                  DataColumn2(
                                    label: Text('Address'),
                                    fixedWidth: 260,
                                  ),
                                  DataColumn2(
                                    label: Text('Harga'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('Ukuran'),
                                    fixedWidth: 70,
                                  ),
                                  DataColumn2(
                                    label: Text('Fasilitas'),
                                    fixedWidth: 70,
                                  ),
                                  DataColumn2(
                                    label: Text('Jarak (Km)'),
                                    fixedWidth: 70,
                                  ),
                                  DataColumn2(
                                    label: Text('Rating'),
                                    fixedWidth: 70,
                                  ),
                                  // DataColumn2(
                                  //   label: Text('Action'),
                                  // ),
                                ],
                                rows: controller.kriteriaList
                                    .map(
                                      (kost) => DataRow(
                                        cells: [
                                          DataCell(Text(kost['id'].toString())),
                                          DataCell(Text(kost['name'])),
                                          DataCell(Text(kost['address'])),
                                          DataCell(Text('${kost['price']}')),
                                          DataCell(Text(
                                              kost['room_size'].toString())),
                                          DataCell(Text(kost['facility']
                                              .toString())),
                                          DataCell(Text('${kost['distance']}')),
                                          DataCell(Text(kost['rating'])),
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
