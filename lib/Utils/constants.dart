import 'package:flutter/material.dart';

final bgClr = Colors.grey.shade200;
final bgClr2 = Colors.grey.shade400;

final primaryClr = Colors.deepOrange;
final whiteClr = Colors.white;
final blackClr = Colors.black;
final successClr=Colors.limeAccent.shade700;
final errorClr=Colors.red;

final eBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: bgClr2, width: 1.5),
);

final fBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: blackClr, width: 1.5),
);

void showSnackBar({
  required BuildContext context,
  required String message,
  required Color clr,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: clr,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Center(
        child: Text(message, style: TextStyle(color: whiteClr, fontSize: 14)),
      ),
    ),
  );
}
