import 'package:blog_app_firebase/models/blogs.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  Future<void> postBlog(
    BuildContext context,
    String uid,
    String blogTitle,
    String blogContent,
    // String blogImage,
  ) async {
    try {
      if (blogContent.isNotEmpty) {
        final firestore = FirebaseFirestore.instance;
        String blogId = Uuid().v1();
        DocumentSnapshot userDoc =
            await firestore.collection("users").doc(uid).get();
        String name = "${userDoc['firstName']} ${userDoc['lastName']}";
        BlogModel blogModel = BlogModel(
          uid: uid,
          blogId: blogId,
          blogTitle: blogTitle,
          name: name,
          blogContent: blogContent,
          postedAt: DateTime.now(),
        );
        firestore.collection("blogs").doc(blogId).set(blogModel.toMap());
        if (context.mounted) {
          showSnackBar(
            context: context,
            message: "Blog Uploaded Successfully!",
            clr: successClr,
          );
        }
      } else {
        showSnackBar(
          context: context,
          message: "There is no content to upload.",
          clr: errorClr,
        );
      }
    } catch (err) {
      if (context.mounted) {
        showSnackBar(context: context, message: err.toString(), clr: errorClr);
      }
    }
  }
}
