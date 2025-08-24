import 'package:blog_app_firebase/Views/blog_container.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser!.email.toString()),
        backgroundColor: bgClr,
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection("blogs")
                .orderBy("postedAt", descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: blackClr, strokeWidth: 2),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return BlogContainer(snap: snapshot.data!.docs[index].data());
            },
          );
        },
      ),
    );
  }
}
