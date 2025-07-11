import 'package:blog_app_firebase/Utils/constants.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

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
              SizedBox(height: screenH * 0.1),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
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
                padding: const EdgeInsets.only(bottom: 5.0),
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
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          color: blackClr,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: screenW * 0.05),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
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
                    "LOGIN",
                    style: TextStyle(color: whiteClr, fontSize: 16),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Divider(color: bgClr2, thickness: 1.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: blackClr, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Divider(color: bgClr2, thickness: 1.5),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteClr,
                        minimumSize: Size(screenW * 0.42, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/googleLogo.png", height: 40),
                          Text(
                            "Google",
                            style: TextStyle(color: blackClr, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteClr,
                        minimumSize: Size(screenW * 0.42, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.phone_iphone_rounded,
                            size: 30,
                            color: blackClr,
                          ),
                          Text(
                            "Phone",
                            style: TextStyle(color: blackClr, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
