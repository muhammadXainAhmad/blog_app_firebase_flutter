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
  Future<void> signUpWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
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

        if (context.mounted) {
          showSnackBar(
            context: context,
            message: "Account Successfully Created!",
            clr: successClr,
          );
          Navigator.of(context).pushReplacementNamed("layout");
        }
      } else {
        if (context.mounted) {
          showSnackBar(
            context: context,
            message: "Please fill all required fields!",
            clr: errorClr,
          );
        }
      }
    } catch (err) {
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: err.toString(),
          clr: successClr,
        );
      }
    }
  }

  // SIGN UP WITH GOOGLE

  // SIGN UP WITH PHONE
  Future<void> loginWithPhone(
    BuildContext context,
    String phoneNumber,
    String fName,
    String lName,
    bool isLogin,
  ) async {
    TextEditingController codeController = TextEditingController();
    try {
      if (phoneNumber.isNotEmpty &&
          (isLogin || (fName.isNotEmpty) && (lName.isNotEmpty))) {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) async {
            UserCredential userCred = await _auth.signInWithCredential(
              phoneAuthCredential,
            );
            if (!isLogin) {
              await _firestore
                  .collection("users")
                  .doc(userCred.user!.uid)
                  .set(
                    UserModel(
                      uid: userCred.user!.uid,
                      firstName: fName,
                      lastName: lName,
                      phoneNumber: phoneNumber,
                    ).toMap(),
                    SetOptions(merge: true),
                  );
            }
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
                  UserCredential userCred = await _auth.signInWithCredential(
                    credential,
                  );
                  if (!isLogin) {
                    await _firestore
                        .collection("users")
                        .doc(userCred.user!.uid)
                        .set(
                          UserModel(
                            uid: userCred.user!.uid,
                            firstName: fName,
                            lastName: lName,
                            phoneNumber: phoneNumber,
                          ).toMap(),
                          SetOptions(merge: true),
                        );
                  }
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed("layout");
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
      } else {
        if (context.mounted) {
          showSnackBar(
            context: context,
            message: "Please fill all required fields!",
            clr: errorClr,
          );
        }
      }
    } catch (err) {
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: err.toString(),
          clr: successClr,
        );
      }
    }
  }

  // LOGIN WITH EMAIL AND PASSWORD
  Future<void> loginWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed("layout");
        }
      } else {
        if (context.mounted) {
          showSnackBar(
            context: context,
            message: "Please fill all required fields!",
            clr: errorClr,
          );
        }
      }
    } catch (err) {
      if (context.mounted) {
        showSnackBar(context: context, message: err.toString(), clr: errorClr);
      }
    }
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
