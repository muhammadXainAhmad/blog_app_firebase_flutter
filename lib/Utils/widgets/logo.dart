
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:flutter/material.dart';

Widget buildLogo(double screenW) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: screenW * 0.35,
        height: screenW * 0.35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [primaryClr, primaryClr.shade300],
            center: Alignment.center,
            radius: 0.9,
          ),
        ),
      ),
      Text("BLOGD.", style: TextStyle(color: whiteClr, fontSize: 32)),
    ],
  );
}
