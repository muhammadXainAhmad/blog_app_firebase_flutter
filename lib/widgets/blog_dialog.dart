import 'package:blog_app_firebase/provider/edit_blog_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void blogDialog(BuildContext context, Map<String, dynamic> snap) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: whiteClr,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
              top: 8,
              bottom: 4,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: bgClr,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: blackClr),
              ),
              child: SimpleDialogOption(
                child: Row(
                  children: [
                    Icon(Icons.edit_note, size: 24, color: blackClr),
                    SizedBox(width: 20),
                    Text("Edit Blog"),
                  ],
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  context.read<EditBlogProvider>().setUpdate(
                    true,blogId: snap["blogId"],
                    title: snap["blogTitle"],
                    content: snap["blogContent"],
                  );
                  Navigator.of(context).pushNamed("addBlog");
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
              top: 8,
              bottom: 4,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: bgClr,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: blackClr),
              ),
              child: SimpleDialogOption(
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, size: 24, color: blackClr),
                    SizedBox(width: 20),
                    Text("Delete Blog"),
                  ],
                ),
                onPressed: () async {},
              ),
            ),
          ),
        ],
      );
    },
  );
}
