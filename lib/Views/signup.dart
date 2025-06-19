import 'package:blog_app_firebase/Utils/constants.dart';
import 'package:flutter/material.dart';

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgClr,
        appBar: AppBar(
          backgroundColor: bgClr,
          iconTheme: IconThemeData(color: blackClr, size: 28),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenH * 0.05),
              buildLogo(screenW),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  "Ready to write?",
                  style: TextStyle(color: blackClr, fontSize: 18),
                ),
              ),
              Text("Let’s get you started!", style: TextStyle(color: blackClr, fontSize: 18),),
              SizedBox(height: screenH * 0.075),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: screenW * 0.42,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteClr,
                        enabledBorder: eBorder,
                        focusedBorder: fBorder,
                        hintText: "First Name",
                        hintStyle: TextStyle(color: blackClr, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenW * 0.42,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteClr,
                        enabledBorder: eBorder,
                        focusedBorder: fBorder,
                        hintText: "Last Name",
                        hintStyle: TextStyle(color: blackClr, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SizedBox(
                  width: screenW * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteClr,
                      enabledBorder: eBorder,
                      focusedBorder: fBorder,
                      hintText: "Email",
                      hintStyle: TextStyle(color: blackClr, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: screenW * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteClr,
                      enabledBorder: eBorder,
                      focusedBorder: fBorder,
                      hintText: "Password",
                      hintStyle: TextStyle(color: blackClr, fontSize: 16),
                      suffixIcon: Icon(
                        Icons.visibility_rounded,
                        size: 26,
                        color: blackClr,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryClr,
                    minimumSize: Size(screenW * 0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(color: whiteClr, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
