import 'package:blog_app_firebase/Utils/constants.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgClr,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: screenW * 0.3,
                      height: screenW * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [primaryClr, primaryClr.shade300],
                          center: Alignment.center,
                          radius: 0.9,
                        ),
                      ),
                    ),
                    Text(
                      "BLOGD.",
                      style: TextStyle(color: whiteClr, fontSize: 32),
                    ),
                  ],
                ),
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
                          fontSize: 16,
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
                    "Login",
                    style: TextStyle(color: whiteClr, fontSize: 18),
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
                      style: TextStyle(color: blackClr, fontSize: 16),
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
                        minimumSize: Size(screenW * 0.45, 50),
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
                            style: TextStyle(color: blackClr, fontSize: 18),
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
                        minimumSize: Size(screenW * 0.45, 50),
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
                            style: TextStyle(color: blackClr, fontSize: 18),
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
