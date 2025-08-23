import 'package:blog_app_firebase/methods/storage_methods.dart';
import 'package:blog_app_firebase/models/blogs.dart';
import 'package:blog_app_firebase/provider/edit_blog_provider.dart';
import 'package:blog_app_firebase/provider/ui_state_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  Future<void> postBlog(
    BuildContext context,
    String uid,
    String blogTitle,
    String blogContent,
  ) async {
    final editProvider = context.read<EditBlogProvider>();
    final uiProvider = context.read<UiStateProvider>();
    try {
      if (blogContent.isNotEmpty) {
        final firestore = FirebaseFirestore.instance;

        DocumentSnapshot userDoc =
            await firestore.collection("users").doc(uid).get();
        String name = "${userDoc['firstName']} ${userDoc['lastName']}";

        if (editProvider.isUpdate) {
          String? downloadUrl = editProvider.imageUrl;
          if (uiProvider.file != null) {
            downloadUrl = await StorageMethods().uploadBlogImage(
              uiProvider.file!,
              editProvider.blogId!,
            );
          }
          await firestore.collection("blogs").doc(editProvider.blogId).update({
            "blogTitle": blogTitle,
            "blogContent": blogContent,
            "blogImage": downloadUrl,
            "updatedAt": DateTime.now(),
          });
          if (context.mounted) {
            showSnackBar(
              context: context,
              message: "Blog Updated Successfully!",
              clr: successClr,
            );
            editProvider.clear();
          }
        } else {
          String blogId = Uuid().v1();
          String? downloadUrl;
          if (context.mounted) {
            downloadUrl = await StorageMethods().uploadBlogImage(
              context.read<UiStateProvider>().file!,
              blogId,
            );
          }
          BlogModel blogModel = BlogModel(
            uid: uid,
            blogId: blogId,
            blogTitle: blogTitle,
            name: name,
            blogContent: blogContent,
            postedAt: DateTime.now(),
            blogImage: downloadUrl,
          );
          firestore.collection("blogs").doc(blogId).set(blogModel.toMap());
          if (context.mounted) {
            showSnackBar(
              context: context,
              message: "Blog Uploaded Successfully!",
              clr: successClr,
            );
          }
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
