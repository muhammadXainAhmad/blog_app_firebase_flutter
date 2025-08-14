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
                      String message = "";
                      message = await AuthMethods().signUpWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        firstName: fNameController.text.trim(),
                        lastName: lNameController.text.trim(),
                      );
                      if (message == "Success") {
                        showSnackBar(
                          context: context,
                          message: "Account Successfully Created!",
                          clr: successClr,
                        );
                      } else {
                        showSnackBar(
                          context: context,
                          message: message,
                          clr: errorClr,
                        );
                      }
                    },
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
      ),
    );
  }
}
