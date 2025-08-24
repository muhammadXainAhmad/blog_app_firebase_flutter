import 'package:blog_app_firebase/provider/nav_bar_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavBarProvider>();
    return Container(
      decoration: BoxDecoration(
        color: whiteClr,
        border: Border(top: BorderSide(color: blackClr)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 28,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => context.read<NavBarProvider>().updateIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: navProvider.selectedIndex == 0 ? blackClr : bgClr2,
            ),
            label: "",
          ),BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: navProvider.selectedIndex == 1 ? blackClr : bgClr2,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: navProvider.selectedIndex == 2 ? blackClr : bgClr2,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
