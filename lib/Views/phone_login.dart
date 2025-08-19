import 'package:blog_app_firebase/methods/auth_methods.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/widgets/logo.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;
    final TextEditingController fNameController = TextEditingController();
    final TextEditingController lNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
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
                    "Log in with phone number",
                    style: TextStyle(color: blackClr, fontSize: 18),
                  ),
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
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteClr,
                        enabledBorder: eBorder,
                        focusedBorder: fBorder,
                        prefixText: "+92 ",
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: blackClr, fontSize: 16),
                      ),
                    ),
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
                      AuthMethods().loginWithPhone(
                        context,
                        "+92${phoneController.text.trim()}",
                        fNameController.text.trim(),
                        lNameController.text.trim(),
                      );
                    },

                    child: Text(
                      "Receive OTP",
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
