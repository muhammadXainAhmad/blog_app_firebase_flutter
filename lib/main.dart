import 'package:blog_app_firebase/Views/home.dart';
import 'package:blog_app_firebase/Views/landing.dart';
import 'package:blog_app_firebase/Views/layout.dart';
import 'package:blog_app_firebase/Views/login.dart';
import 'package:blog_app_firebase/Views/phone_login.dart';
import 'package:blog_app_firebase/Views/signup.dart';
import 'package:blog_app_firebase/firebase_options.dart';
import 'package:blog_app_firebase/provider/ui_state_provider.dart';
import 'package:blog_app_firebase/provider/nav_bar_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavBarProvider()),
        ChangeNotifierProvider(create: (context) => UiStateProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          "login": (context) => const LoginPage(),
          "signup": (context) => const SignUpPage(),
          "home": (context) => const HomePage(),
          "landing": (context) => const LandingPage(),
          "phone": (context) {
            final args = ModalRoute.of(context)!.settings.arguments as bool;
            return PhoneLoginPage(isLogin: args);
          },
          "layout": (context) => const Layout(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const Layout();
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return LandingPage();
          },
        ),
      ),
    );
  }
}
