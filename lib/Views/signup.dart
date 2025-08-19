import 'package:blog_app_firebase/methods/auth_methods.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/widgets/logo.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;

    final TextEditingController fNameController = TextEditingController();
    final TextEditingController lNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Ready to write?",
                    style: TextStyle(color: blackClr, fontSize: 18),
                  ),
                ),
                Text(
                  "Let’s get you started!",
                  style: TextStyle(color: blackClr, fontSize: 18),
                ),
                SizedBox(height: screenH * 0.075),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: screenW * 0.42,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: fNameController,
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
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: lNameController,
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
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: passwordController,
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
                    onPressed: () async {
                      await AuthMethods().signUpWithEmailAndPassword(
                        context: context,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        firstName: fNameController.text.trim(),
                        lastName: lNameController.text.trim(),
                      );
                    },
                    child: Text(
                      "SIGNUP",
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
                          Navigator.of(context).pushNamed("phone");
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
                  onPressed: () => Navigator.of(context).pushNamed("login"),
                  child: Text(
                    "Already have an account?",
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
