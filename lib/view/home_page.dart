import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelio/config/app_assets.dart';
import 'package:hotelio/config/app_colors.dart';
import 'package:hotelio/controller/c_home.dart';
import 'package:hotelio/view/nearby_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAssets.iconNearby, 'label': 'Nearby'},
    {'icon': AppAssets.iconHistory, 'label': 'History'},
    {'icon': AppAssets.iconPayment, 'label': 'Payment'},
    {'icon': AppAssets.iconReward, 'label': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cHome.indexPage == 1) {
          return const Center(child: Text('History'));
        }
        return NearbyPage();
      }),
      bottomNavigationBar: Obx(() {
        return Material(
          elevation: 8,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: BottomNavigationBar(
                currentIndex: cHome.indexPage,
                onTap: (value) => cHome.indexPage = value,
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.black,
                selectedIconTheme:
                    const IconThemeData(color: AppColors.primary),
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
                selectedFontSize: 12,
                items: listNav.map((e) {
                  return BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(e['icon']),
                    ),
                    label: e['label'],
                  );
                }).toList()),
          ),
        );
      }),
    );
  }
}
