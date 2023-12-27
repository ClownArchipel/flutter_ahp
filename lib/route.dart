import 'package:ahp/core.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute{
  var r=[
    GetPage(name: '/dashboard', page: () => const DashboardView()),
    GetPage(name: '/master-kost', page: () => const MasterKostView()),
    GetPage(name: '/master-kost/input', page: () => const InputMasterKostView()),
    GetPage(name: '/master-kriteria', page: () => const MasterKriteriaView()),
    GetPage(name: '/setting-kriteria', page: () => const SettingKriteriaView()),
    GetPage(name: '/perhitungan', page: () => const PerhitunganView()),
    GetPage(name: '/rekomendasi-pilihan', page: () => const RekomendasiPilihanView()),
  ];
}