import 'package:blog_app_firebase/Views/read_blog.dart';
import 'package:blog_app_firebase/methods/auth_methods.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/widgets/blog_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 7.0),
          child: Text(
            "MY BLOGS",
            style: TextStyle(
              color: blackClr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: bgClr,
        actions: [
          IconButton(
            tooltip: "Sign Out",
            onPressed: () async {
              await AuthMethods().signOut(context);
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(Icons.logout, color: blackClr, size: 26),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection("blogs")
                .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: blackClr,
                strokeWidth: 1.5,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You haven't shared any blogs yet.",
                      style: TextStyle(
                        color: blackClr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Start writing your first one!",
                      style: TextStyle(
                        color: blackClr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot snap = snapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReadBlogPage(snap: snap),
                    ),
                  );
                },
                onLongPress: () {
                  blogDialog(context, snap.data() as Map<String, dynamic>);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteClr,
                      border: Border.all(color: blackClr, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image(
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                          : null,
                                  color: blackClr,
                                  strokeWidth: 1.5,
                                ),
                              );
                            },
                            image: NetworkImage(snap["blogImage"]),
                            width: screenW * 0.465,
                            height: screenH * 0.2,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snap["blogTitle"],
                                  style: TextStyle(
                                    color: blackClr,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(
                                    snap["postedAt"].toDate(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
