import 'package:blog_app_firebase/methods/firestore_methods.dart';
import 'package:blog_app_firebase/provider/edit_blog_provider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final editProvider = context.read<EditBlogProvider>();
      if (editProvider.isUpdate) {
        titleController.text = editProvider.title ?? '';
        blogController.text = editProvider.content ?? '';
      }
    });
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
    final editProvider = context.watch<EditBlogProvider>();
    final uiProvider = context.watch<UiStateProvider>();
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          final editProvider = context.read<EditBlogProvider>();
          editProvider.clear();
          context.read<UiStateProvider>().showImage(null);
        }
      },
      child: Scaffold(
        backgroundColor: bgClr,
        appBar: AppBar(
          backgroundColor: bgClr,
          title: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              editProvider.isUpdate ? "Edit blog" : "Post a new blog",
              style: TextStyle(color: blackClr, fontSize: 22),
            ),
          ),
          actions: [
            editProvider.isUpdate
                ? Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: IconButton(
                    onPressed: () {
                      editProvider.clear();
                      titleController.clear();
                      blogController.clear();
                      context.read<UiStateProvider>().showImage(null);
                    },
                    icon: Icon(Icons.close, size: 28, color: blackClr),
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                  child:
                      uiProvider.file != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: MemoryImage(uiProvider.file!),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              width: screenW * 0.9,
                              height: screenH * 0.25,
                            ),
                          )
                          : (editProvider.imageUrl != null &&
                              editProvider.imageUrl!.isNotEmpty)
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              width: screenW * 0.9,
                              height: screenH * 0.25,
                              editProvider.imageUrl!,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          )
                          : Container(
                            width: screenW * 0.9,
                            height: screenH * 0.25,
                            decoration: BoxDecoration(
                              color: whiteClr,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: bgClr2, width: 1.5),
                            ),
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 32,
                              color: blackClr,
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
                        Navigator.of(context).pushNamed("home");
                      }
                    },
                    child:
                        uiProvider.isLoading
                            ? CircularProgressIndicator(
                              color: whiteClr,
                              strokeWidth: 2,
                            )
                            : editProvider.isUpdate
                            ? Text(
                              "UPDATE",
                              style: TextStyle(color: whiteClr, fontSize: 16),
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
      ),
    );
  }
}
