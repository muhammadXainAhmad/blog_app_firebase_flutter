import 'package:flutter/material.dart';

final bgClr = Colors.grey.shade200;
final bgClr2 = Colors.grey.shade400;

final primaryClr = Colors.deepOrange;
final whiteClr = Colors.white;
final blackClr = Colors.black;

final eBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: bgClr2, width: 1.5),
);

final fBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: blackClr, width: 1.5),
);

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
