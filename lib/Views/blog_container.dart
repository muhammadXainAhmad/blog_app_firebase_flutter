import 'package:blog_app_firebase/Views/read_blog.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/widgets/blog_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogContainer extends StatelessWidget {
  final snap;
  const BlogContainer({super.key, required this.snap});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Container(
            width: screenW * 0.9,
            decoration: BoxDecoration(
              color: whiteClr,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: blackClr),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: 18,
                    bottom: 8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          snap["blogTitle"],
                          style: TextStyle(
                            color: blackClr,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      snap["uid"] == FirebaseAuth.instance.currentUser!.uid
                          ? InkWell(
                            onTap: () {
                              blogDialog(context, snap);
                            },
                            child: Icon(
                              Icons.more_vert,
                              size: 24,
                              color: blackClr,
                            ),
                          )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
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
                Divider(color: blackClr, indent: 20, endIndent: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      snap["blogContent"],
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 18),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryClr,
                      minimumSize: Size(screenW * 0.85, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ReadBlogPage(snap: snap),
                        ),
                      );
                    },
                    child: Text(
                      "Read more",
                      style: TextStyle(color: whiteClr, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
