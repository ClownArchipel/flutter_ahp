import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/perhitungan_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';

class PerhitunganView extends StatelessWidget {
  const PerhitunganView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerhitunganController>(
      init: PerhitunganController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Perhitungan",
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white, // Ganti warna tombol drawer di sini
              ),
              backgroundColor: MyColor.mainCol,
            ),
            drawer: const MyDrawer(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.replay_outlined),
              onPressed: () {
                controller.load();
              },
            ),
            body: Obx(() {
              if (controller.isLoading.value == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Perbandingan Kriteria',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                        height: 0.5.sh,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              child: DataTable2(
                                headingRowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                }),
                                headingTextStyle:
                                    const TextStyle(color: Colors.white),
                                columnSpacing: 2,
                                horizontalMargin: 10,
                                // fixedLeftColumns: 1,
                                minWidth: 260,
                                columns: const [
                                  DataColumn2(
                                      label: Text('Kriteria.'), fixedWidth: 80),
                                  DataColumn2(
                                    label: Text('K1'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K2'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K3'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K4'),
                                    fixedWidth: 50,
                                  ),
                                ],
                                rows:[
                                  DataRow(cells: [
                                    const DataCell(Text('K1')),
                                    DataCell(Text(controller.perhiList[0][0].toString())),
                                    DataCell(Text(controller.perhiList[1][0].toString())),
                                    DataCell(Text(controller.perhiList[2][0].toString())),
                                    DataCell(Text(controller.perhiList[3][0].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K2')),
                                    DataCell(Text(controller.perhiList[0][1].toString())),
                                    DataCell(Text(controller.perhiList[1][1].toString())),
                                    DataCell(Text(controller.perhiList[2][1].toString())),
                                    DataCell(Text(controller.perhiList[3][1].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K3')),
                                    DataCell(Text(controller.perhiList[0][2].toString())),
                                    DataCell(Text(controller.perhiList[1][2].toString())),
                                    DataCell(Text(controller.perhiList[2][2].toString())),
                                    DataCell(Text(controller.perhiList[3][2].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K4')),
                                    DataCell(Text(controller.perhiList[0][3].toString())),
                                    DataCell(Text(controller.perhiList[1][3].toString())),
                                    DataCell(Text(controller.perhiList[2][3].toString())),
                                    DataCell(Text(controller.perhiList[3][3].toString())),
                                  ]),
                                ]
                                    
                              ),
                            ),
                          ),
                        )),
                    const Text(
                      'Hasil Perbandingan',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                        height: 0.5.sh,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              child: DataTable2(
                                headingRowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                }),
                                headingTextStyle:
                                    const TextStyle(color: Colors.white),
                                columnSpacing: 2,
                                horizontalMargin: 10,
                                fixedLeftColumns: 1,
                                minWidth: 700,
                                columns: const [
                                  DataColumn2(
                                      label: Text('Kriteria.'), fixedWidth: 80),
                                  DataColumn2(
                                    label: Text('K1'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K2'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K3'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K4'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('Jumlah'),
                                    fixedWidth: 60,
                                  ),
                                  DataColumn2(
                                    label: Text('Prioritas'),
                                    fixedWidth: 50,
                                  ),
                                ],
                                 rows:[
                                  DataRow(cells: [
                                    const DataCell(Text('K1')),
                                    DataCell(Text(controller.jmlnilaiList[0][0].toString())),
                                    DataCell(Text(controller.jmlnilaiList[1][0].toString())),
                                    DataCell(Text(controller.jmlnilaiList[2][0].toString())),
                                    DataCell(Text(controller.jmlnilaiList[3][0].toString())),
                                    DataCell(Text((controller.jmlnilaiList[0][0]+controller.jmlnilaiList[1][0]+controller.jmlnilaiList[2][0]+controller.jmlnilaiList[3][0]).toString())),
                                    DataCell(Text(controller.prioritasList[0].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K2')),
                                    DataCell(Text(controller.jmlnilaiList[0][1].toString())),
                                    DataCell(Text(controller.jmlnilaiList[1][1].toString())),
                                    DataCell(Text(controller.jmlnilaiList[2][1].toString())),
                                    DataCell(Text(controller.jmlnilaiList[3][1].toString())),
                                    DataCell(Text((controller.jmlnilaiList[0][1]+controller.jmlnilaiList[1][1]+controller.jmlnilaiList[2][1]+controller.jmlnilaiList[3][1]).toString())),
                                    DataCell(Text(controller.prioritasList[1].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K3')),
                                    DataCell(Text(controller.jmlnilaiList[0][2].toString())),
                                    DataCell(Text(controller.jmlnilaiList[1][2].toString())),
                                    DataCell(Text(controller.jmlnilaiList[2][2].toString())),
                                    DataCell(Text(controller.jmlnilaiList[3][2].toString())),
                                    DataCell(Text((controller.jmlnilaiList[0][2]+controller.jmlnilaiList[1][2]+controller.jmlnilaiList[2][2]+controller.jmlnilaiList[3][2]).toString())),
                                    DataCell(Text(controller.prioritasList[2].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K4')),
                                    DataCell(Text(controller.jmlnilaiList[0][3].toString())),
                                    DataCell(Text(controller.jmlnilaiList[1][3].toString())),
                                    DataCell(Text(controller.jmlnilaiList[2][3].toString())),
                                    DataCell(Text(controller.jmlnilaiList[3][3].toString())),
                                    DataCell(Text((controller.jmlnilaiList[0][3]+controller.jmlnilaiList[1][3]+controller.jmlnilaiList[2][3]+controller.jmlnilaiList[3][3]).toString())),
                                    DataCell(Text(controller.prioritasList[3].toString())),
                                  ]),
                                ]
                              ),
                            ),
                          ),
                        )),
                    const Text(
                      'Nilai Eigen',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                        height: 0.5.sh,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              child: DataTable2(
                                headingRowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                }),
                                headingTextStyle:
                                    const TextStyle(color: Colors.white),
                                columnSpacing: 2,
                                horizontalMargin: 10,
                                fixedLeftColumns: 1,
                                minWidth: 600,
                                columns: const [
                                  DataColumn2(
                                      label: Text('Kriteria.'), fixedWidth: 80),
                                  DataColumn2(
                                    label: Text('K1'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K2'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K3'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('K4'),
                                    fixedWidth: 50,
                                  ),
                                  DataColumn2(
                                    label: Text('Jumlah'),
                                    fixedWidth: 80,
                                  ),
                                ],
                                rows:[
                                  DataRow(cells: [
                                    const DataCell(Text('K1')),
                                    DataCell(Text(controller.eigenList[0][0].toString())),
                                    DataCell(Text(controller.eigenList[1][0].toString())),
                                    DataCell(Text(controller.eigenList[2][0].toString())),
                                    DataCell(Text(controller.eigenList[3][0].toString())),
                                    DataCell(Text((controller.eigenList[0][0]+controller.eigenList[1][0]+controller.eigenList[2][0]+controller.eigenList[3][0]).toString())),

                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K2')),
                                    DataCell(Text(controller.eigenList[0][1].toString())),
                                    DataCell(Text(controller.eigenList[1][1].toString())),
                                    DataCell(Text(controller.eigenList[2][1].toString())),
                                    DataCell(Text(controller.eigenList[3][1].toString())),
                                    DataCell(Text((controller.eigenList[0][1]+controller.eigenList[1][1]+controller.eigenList[2][1]+controller.eigenList[3][1]).toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K3')),
                                    DataCell(Text(controller.eigenList[0][2].toString())),
                                    DataCell(Text(controller.eigenList[1][2].toString())),
                                    DataCell(Text(controller.eigenList[2][2].toString())),
                                    DataCell(Text(controller.eigenList[3][2].toString())),
                                    DataCell(Text((controller.eigenList[0][2]+controller.eigenList[1][2]+controller.eigenList[2][2]+controller.eigenList[3][2]).toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K4')),
                                    DataCell(Text(controller.eigenList[0][3].toString())),
                                    DataCell(Text(controller.eigenList[1][3].toString())),
                                    DataCell(Text(controller.eigenList[2][3].toString())),
                                    DataCell(Text(controller.eigenList[3][3].toString())),
                                    DataCell(Text((controller.eigenList[0][3]+controller.eigenList[1][3]+controller.eigenList[2][3]+controller.eigenList[3][3]).toString())),
                                  ]),
                                ]
                              ),
                            ),
                          ),
                        )),
                    const Text(
                      'Perhitungan Rasio Konstanta',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                        height: 0.5.sh,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              child: DataTable2(
                                headingRowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                }),
                                headingTextStyle:
                                    const TextStyle(color: Colors.white),
                                columnSpacing: 2,
                                horizontalMargin: 10,
                                // fixedLeftColumns: 1,
                                minWidth: 260,
                                columns: const [
                                  DataColumn2(
                                      label: Text('Kriteria.'), fixedWidth: 90),
                                  DataColumn2(
                                    label: Text('Jumlah'),
                                    fixedWidth: 60,
                                  ),
                                  DataColumn2(
                                    label: Text('Prioritas'),
                                    fixedWidth: 70,
                                  ),
                                  DataColumn2(
                                    label: Text('Hasil'),
                                    fixedWidth: 60,
                                  ),
                                ],
                                 rows:[
                                  DataRow(cells: [
                                    const DataCell(Text('K1')),
                                    DataCell(Text((controller.eigenList[0][0]+controller.eigenList[1][0]+controller.eigenList[2][0]+controller.eigenList[3][0]).toString())),
                                    DataCell(Text(controller.prioritasList[0].toString())),
                                    DataCell(Text(controller.konstantaList[0].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K2')),
                                    DataCell(Text((controller.eigenList[0][1]+controller.eigenList[1][1]+controller.eigenList[2][1]+controller.eigenList[3][1]).toString())),
                                    DataCell(Text(controller.prioritasList[1].toString())),
                                    DataCell(Text(controller.konstantaList[1].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K3')),
                                    DataCell(Text((controller.eigenList[0][2]+controller.eigenList[1][2]+controller.eigenList[2][2]+controller.eigenList[3][2]).toString())),
                                    DataCell(Text(controller.prioritasList[2].toString())),
                                    DataCell(Text(controller.konstantaList[2].toString())),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('K4')),
                                    DataCell(Text((controller.eigenList[0][3]+controller.eigenList[1][3]+controller.eigenList[2][3]+controller.eigenList[3][3]).toString())),
                                    DataCell(Text(controller.prioritasList[3].toString())),
                                    DataCell(Text(controller.konstantaList[3].toString())),
                                  ]),
                                
                                ]
                              ),
                            ),
                          ),
                        )),
                        const Text(
                      'Hasil Perangkingan',
                      style: TextStyle(fontSize: 20),
                    ),
                        SizedBox(
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
                                    label: Text('Rating'),
                                    fixedWidth: 70,
                                  ),
                                  // DataColumn2(
                                  //   label: Text('Action'),
                                  // ),
                                ],
                                rows: controller.perhitunganList
                                    .map(
                                      (kost) => DataRow(
                                        cells: [
                                          DataCell(Text(kost['id'].toString())),
                                          DataCell(Text(kost['name'])),
                                          DataCell(Text(kost['address'])),
                                          DataCell(Text('${kost['price'].toString()}')),
                                          DataCell(Text(kost['facility']
                                              .toString())),
                                          DataCell(Text(
                                              kost['room_size'].toString())),
                                          DataCell(Text(kost['rating'].toString())),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ))
                  ],
                ));
              }
            }));
      },
    );
  }
}
