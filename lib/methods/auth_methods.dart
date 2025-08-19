import 'package:blog_app_firebase/Utils/constants.dart';
import 'package:blog_app_firebase/models/users.dart';
import 'package:blog_app_firebase/widgets/show_otp_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // SIGN UP USING EMAIL AND PASSWORD
  Future<String> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    String message = "";
    try {
      if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel user = UserModel(
          uid: userCred.user!.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );

        await _firestore
            .collection("users")
            .doc(userCred.user!.uid)
            .set(user.toMap());

        message = "Success";
      } else {
        message = "Please fill all required fields!";
      }
    } catch (err) {
      message = err.toString();
    }
    return message;
  }

  // SIGN UP WITH GOOGLE

  // SIGN UP WITH PHONE
  Future<String> loginWithPhone(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    String message = "";
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          showSnackBar(
            context: context,
            message: error.message!,
            clr: errorClr,
          );
        },
        codeSent: (verificationId, forceResendingToken) async {
          showOTPDialog(
            context: context,
            codeController: codeController,
            onPressed: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: codeController.text.trim(),
                );
                await _auth.signInWithCredential(credential);
                if (context.mounted) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed("home");
                }
              } catch (err) {
                if (context.mounted) {
                  Navigator.of(context).pop();
                  showSnackBar(
                    context: context,
                    message: err.toString(),
                    clr: errorClr,
                  );
                }
              }
            },
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (err) {
      message = err.toString();
    }
    return message;
  }

  // LOGIN WITH EMAIL AND PASSWORD
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String message = "";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        message = "Success";
      } else {
        message = "Please fill all required fields!";
      }
    } catch (err) {
      message = err.toString();
    }
    return message;
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
