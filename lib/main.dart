import 'package:blog_app_firebase/Views/home.dart';
import 'package:blog_app_firebase/Views/landing.dart';
import 'package:blog_app_firebase/Views/login.dart';
import 'package:blog_app_firebase/Views/signup.dart';
import 'package:blog_app_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
