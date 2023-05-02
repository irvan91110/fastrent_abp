import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pages_dashboard_controller.dart';
import 'package:fastrent/app/modules/pages/history/views/history_view.dart';

import 'package:fastrent/app/modules/pages/home/views/home_view.dart';

import 'package:fastrent/app/modules/pages/profile/views/pages_profile_view.dart';

import 'package:fastrent/app/data/utils/app_colors.dart';

class PagesDashboardView extends GetView<PagesDashboardController> {
  PagesDashboardView({Key? key}) : super(key: key);
  final List<Widget> _pages = [
    HomeView(),
    HistoryView(),
    PagesProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Obx(
      //() => Text("Current index is ${controller.currentIndex}"),
      //),
      body: Obx(() => _pages[controller.currentIndex]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.currentIndex,
          selectedItemColor: Rcolors.primary,
          onTap: controller.changePage,
          selectedFontSize: 14.0, // set font size to same value
          unselectedFontSize: 14.0, // set font size to same value
        ),
      ),
    );
  }
}
