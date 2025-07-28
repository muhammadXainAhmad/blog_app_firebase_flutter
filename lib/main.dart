import 'package:blog_app_firebase/Views/home.dart';
import 'package:blog_app_firebase/Views/landing.dart';
import 'package:blog_app_firebase/Views/login.dart';
import 'package:blog_app_firebase/Views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignUpPage(),
        "home": (context) => const HomePage(),
      },
      home: LandingPage(),
    );
  }
}
