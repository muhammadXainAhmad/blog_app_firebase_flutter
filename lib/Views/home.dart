import 'package:blog_app_firebase/methods/auth_methods.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/Views/nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: HomeNavBar(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await AuthMethods().signOut();
              if (context.mounted) {
                Navigator.of(context).pushReplacementNamed("landing");
              }
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        width: screenW * 0.9,
                        height: screenH * 0.25,
                        decoration: BoxDecoration(
                          color: bgClr,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: blackClr),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 18,
                                  right: 18,
                                  top: 8,
                                  bottom: 8,
                                ),
                                child: Text(
                                  "Title",
                                  style: TextStyle(
                                    color: blackClr,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                                right: 18,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      Text(
                                        "Full Name",
                                        style: TextStyle(
                                          color: blackClr,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "June 25, 2025",
                                    style: TextStyle(
                                      color: blackClr,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: blackClr, indent: 20, endIndent: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                                right: 18,
                                bottom: 8,
                              ),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel justo nec urna fermentum eleifend.",
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryClr,
                                minimumSize: Size(screenW * 0.85, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Read more",
                                style: TextStyle(color: whiteClr, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
