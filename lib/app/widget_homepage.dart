import 'package:flutter/material.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import 'package:pos_app/utils/constant/app_colors.dart';
import '../feature/presentation/pages/alert_page/alert_page.dart';
import '../feature/presentation/pages/history_page/history_page.dart';
import '../feature/presentation/pages/new_password/new_password.dart';
import '../feature/presentation/pages/table_screen/tables.dart';
import 'home/main_page.dart';

Widget buildPage(int index) {
  List<Widget> widgetPages = <Widget>[
    const MainPage(),
    const TablePage(),
    const NewPasswordScreen(),
    const TablePage(),
    const HistoryPage(),
    Container(
      color: completed,
    ),
    const AlertPage(),
    Container(color: pending),
  ];
  return widgetPages[index];
}

var bottomTab = const [
  BottomNavigationBarItem(
    label: "home",
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: "Tables",
    icon: Icon(Icons.category),
  ),
  BottomNavigationBarItem(
    label: "Waitin",
    icon: Icon(Icons.work),
  ),
  BottomNavigationBarItem(
    label: "Settings",
    icon: Icon(Icons.settings),
  ),
];

var navigationRail = [
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/home1.png",
      fit: BoxFit.contain,
      width: 18,
      height: 18,
    ),
    label: const Text(
      "Home",
    ),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/table1.png",
      fit: BoxFit.contain,
      width: 18,
      height: 18,
    ),
    label: const Text("Table"),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/menu1.png",
      color: buttonColor,
      fit: BoxFit.contain,
      width: 22,
      height: 22,
    ),
    label: const Text("Menu"),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/order1.png",
      fit: BoxFit.contain,
      width: 22,
      height: 22,
    ),
    label: const Text("Order"),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/history1.png",
      fit: BoxFit.contain,
      width: 22,
      height: 22,
    ),
    label: const Text("History"),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/report1.png",
      fit: BoxFit.contain,
      width: 18,
      height: 18,
    ),
    label: const Text("Report"),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/alert1.png",
      fit: BoxFit.contain,
      width: 18,
      height: 18,
    ),
    label: const Text("Alert"),
  ),
  NavigationRailDestination(
    icon: Image.asset(
      "assets/dash_icon/plus1.png",
      color: fontgrey,
      fit: BoxFit.contain,
      width: 18,
      height: 18,
    ),
    label: SmallText(
      text: "Add",
      size: 12,
      color: fontgrey,
    ),
  ),
];
