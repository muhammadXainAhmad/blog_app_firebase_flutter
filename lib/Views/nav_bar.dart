import 'package:blog_app_firebase/Utils/constants.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: blackClr),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: blackClr),
            label: "",
          ),
        ],
      ),
    );
  }
}
