import 'package:blog_app_firebase/methods/firestore_methods.dart';
import 'package:blog_app_firebase/provider/edit_blog_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReadBlogPage extends StatelessWidget {
  final snap;
  const ReadBlogPage({super.key, required this.snap});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        backgroundColor: bgClr,
        actions: [
          snap["uid"] == FirebaseAuth.instance.currentUser!.uid
              ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        context.read<EditBlogProvider>().setUpdate(
                          true,
                          blogId: snap["blogId"],
                          title: snap["blogTitle"],
                          content: snap["blogContent"],
                          imageUrl: snap["blogImage"],
                        );
                        Navigator.of(context).pushNamed("addBlog");
                      },
                      icon: Icon(Icons.edit_note, size: 28, color: blackClr),
                    ),
                    IconButton(
                      onPressed: () async {
                        await FirestoreMethods().deleteBlog(
                          context,
                          snap["blogId"],
                        );
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                      icon: Icon(Icons.delete, size: 24, color: blackClr),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  snap["blogTitle"],
                  style: TextStyle(
                    color: blackClr,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text(
                          snap["name"],
                          style: TextStyle(color: blackClr, fontSize: 14),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat.yMMMd().format(snap["postedAt"].toDate()),
                      style: TextStyle(color: blackClr, fontSize: 14),
                    ),
                  ],
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  width: screenW * 0.9,
                  height: screenH * 0.25,
                  image: NetworkImage(snap["blogImage"]),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: screenW * 0.9,
                      height: screenH * 0.25,
                      child: Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                          color: blackClr,
                          strokeWidth: 1.5,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                child: Text(
                  snap["blogContent"],
                  style: TextStyle(color: blackClr, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
