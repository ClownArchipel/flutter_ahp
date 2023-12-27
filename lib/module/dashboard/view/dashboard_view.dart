import 'package:ahp/config.dart';
import 'package:ahp/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import '../controller/dashboard_controller.dart';
import 'package:ahp/core.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Dashboard",
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white, // Ganti warna tombol drawer di sini
            ),
            backgroundColor: MyColor.mainCol,
          ),
          drawer: const MyDrawer(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    const CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('assets/icons/ahp.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    Text("Selamat datang di aplikasi AHP untuk penentuan rekomendasi kost terbaik anda",textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
