import 'package:blog_app_firebase/utils/constants.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: bgClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "BLOGD",
                      style: TextStyle(
                        color: blackClr,
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ".",
                      style: TextStyle(color: primaryClr, fontSize: 52),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Personal Blogging Partner",
                style: TextStyle(color: blackClr, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: screenW * 0.7,
                    height: screenW * 0.7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [primaryClr, primaryClr.shade300],
                        center: Alignment.center,
                        radius: 0.9,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Tell your",
                          style: TextStyle(color: blackClr, fontSize: 24),
                        ),
                        TextSpan(
                          text: " story ",
                          style: TextStyle(
                            color: blackClr,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "with us.",
                          style: TextStyle(color: blackClr, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("login");
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenW * 0.75, 50),
                  backgroundColor: bgClr,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: blackClr, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: blackClr,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("signup");
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenW * 0.75, 50),
                  backgroundColor: blackClr,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: blackClr, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: whiteClr,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
