import 'package:blog_app_firebase/methods/firestore_methods.dart';
import 'package:blog_app_firebase/provider/ui_state_provider.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:blog_app_firebase/widgets/image_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  late final TextEditingController blogController;
  late final TextEditingController titleController;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    blogController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    blogController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final screenH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        backgroundColor: bgClr,
        title: Text(
          "Post a new blog",
          style: TextStyle(color: blackClr, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: SizedBox(
                  width: screenW * 0.9,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: titleController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteClr,
                      enabledBorder: eBorder,
                      focusedBorder: fBorder,
                      hintText: "Blog Title",
                      hintStyle: TextStyle(color: blackClr, fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  showImageDialog(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: blackClr),
                    color: whiteClr,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenW * 0.9,
                  height: screenH * 0.25,
                  child:
                      context.watch<UiStateProvider>().file == null
                          ? Icon(
                            Icons.add_a_photo_outlined,
                            size: 32,
                            color: blackClr,
                          )
                          : Image(
                            image: MemoryImage(
                              context.watch<UiStateProvider>().file!,
                            ),
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: SizedBox(
                  width: screenW * 0.9,
                  child: TextField(
                    controller: blogController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 5,
                    maxLines: 50,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteClr,
                      enabledBorder: eBorder,
                      focusedBorder: fBorder,
                      hintText: "Blog Description",
                      hintStyle: TextStyle(color: blackClr, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryClr,
                    minimumSize: Size(screenW * 0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final loadingProvider = context.read<UiStateProvider>();
                    loadingProvider.updateIsLoading(true);
                    await FirestoreMethods().postBlog(
                      context,
                      _auth.currentUser!.uid,
                      titleController.text.trim(),
                      blogController.text.trim(),
                    );
                    loadingProvider.updateIsLoading(false);
                    blogController.clear();
                    titleController.clear();
                    if (context.mounted) {
                      context.read<UiStateProvider>().showImage(null);
                    }
                  },
                  child:
                      context.watch<UiStateProvider>().isLoading
                          ? CircularProgressIndicator(
                            color: whiteClr,
                            strokeWidth: 2,
                          )
                          : Text(
                            "UPLOAD",
                            style: TextStyle(color: whiteClr, fontSize: 16),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
