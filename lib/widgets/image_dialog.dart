import 'dart:typed_data';

import 'package:blog_app_firebase/provider/ui_state_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void showImageDialog(BuildContext context) {
  final uiProvider = context.read<UiStateProvider>();
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: whiteClr,
        title: const Text("Pick an image"),
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
                    Icon(Icons.camera_alt_outlined, size: 24, color: blackClr),
                    SizedBox(width: 20),
                    Text("Take a photo"),
                  ],
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  uiProvider.showImage(file);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
              top: 4,
              bottom: 8,
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
                    Icon(Icons.file_upload_outlined, size: 24, color: blackClr),
                    SizedBox(width: 20),
                    Text("Upload from gallery"),
                  ],
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  uiProvider.showImage(file);
                },
              ),
            ),
          ),
          uiProvider.file != null
              ? Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
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
                        Text("Remove image"),
                      ],
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      uiProvider.showImage(null);
                    },
                  ),
                ),
              )
              : SizedBox.shrink(),
        ],
      );
    },
  );
}
