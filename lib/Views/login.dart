import 'package:blog_app_firebase/methods/auth_methods.dart';
import 'package:blog_app_firebase/provider/ui_state_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
        body: SingleChildScrollView(
          child: Center(
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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
                      obscureText: context.watch<UiStateProvider>().hidePass,
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteClr,
                        enabledBorder: eBorder,
                        focusedBorder: fBorder,
                        hintText: "Password",
                        hintStyle: TextStyle(color: blackClr, fontSize: 16),
                        suffixIcon: GestureDetector(
                          onTap:
                              () =>
                                  context
                                      .read<UiStateProvider>()
                                      .toggleHidePass(),
                          child: Icon(
                            context.watch<UiStateProvider>().hidePass
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 26,
                            color: blackClr,
                          ),
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
                    onPressed: () async {
                      final loadingProvider = context.read<UiStateProvider>();
                      loadingProvider.updateIsLoading(true);
                      await AuthMethods().loginWithEmailAndPassword(
                        context: context,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      loadingProvider.updateIsLoading(false);
                    },
                    child:
                        context.watch<UiStateProvider>().isLoading
                            ? CircularProgressIndicator(
                              color: whiteClr,
                              strokeWidth: 2,
                            )
                            : Text(
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
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed("phone", arguments: true);
                        },
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

                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed("signup"),
                  child: Text(
                    "Create a new account?",
                    style: TextStyle(color: primaryClr, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
