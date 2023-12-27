import 'package:flutter/material.dart';
import '../controller/rekomendasi_pilihan_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';

class RekomendasiPilihanView extends StatelessWidget {
  const RekomendasiPilihanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RekomendasiPilihanController>(
      init: RekomendasiPilihanController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Rekomendasi Pilihan",
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white, // Ganti warna tombol drawer di sini
              ),
              backgroundColor: MyColor.mainCol,
              actions: [
                IconButton(
                    onPressed: () => controller.fetch(),
                    icon: const Icon(Icons.refresh))
              ],
            ),
            drawer: const MyDrawer(),
            body: Obx(() {
              if(controller.isloading.value == true){
                return const Center(child: CircularProgressIndicator(),);
              }else{
                return SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Rekomendasi Terbaik untuk Anda adalah :'),
                        Center(
                          child: Text(
                            controller.rekom.value,
                            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
              }
            }));
      },
    );
  }
}
