import 'package:blog_app_firebase/utils/constants.dart';
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
          padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text(
                    snap["blogTitle"],
                    style: TextStyle(
                      color: blackClr,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryClr,
                      minimumSize: Size(screenW * 0.85, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
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
