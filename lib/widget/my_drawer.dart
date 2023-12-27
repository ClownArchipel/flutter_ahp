import 'package:ahp/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColor.mainCol,
            ),
            child: const Column(
              children: [
                Text('AHP Apss', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.home_rounded),
                SizedBox(width: 10,),
                Text('HOME'),
              ],
            ),
            onTap: () {
              Get.offNamed('/dashboard');
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.list_alt_rounded),
                SizedBox(width: 10,),
                 Text('DATA KOST'),
              ],
            ),
            onTap: () {
              Get.offNamed('/master-kost');
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.list_alt_rounded),
                SizedBox(width: 10,),
                Text('MASTER KRITERIA')
              ],
            ),
            onTap: () {
              Get.offNamed('/master-kriteria');
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.settings_rounded),
                SizedBox(width: 10,),
                Text('SETTING KRITERIA'),
              ],
            ),
            onTap: () {
              Get.offNamed('/setting-kriteria');
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.calculate),
                SizedBox(width: 10,),
                Text('PERHITUNGAN'),
              ],
            ),
            onTap: () {
              Get.offNamed('/perhitungan');
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.recommend_rounded),
                SizedBox(width: 10,),
                Text('REKOMENDASI PILIHAN'),
              ],
            ),
            onTap: () {
              Get.offNamed('/rekomendasi-pilihan');
            },
          ),
        ],
      ),
    );
  }
}
