import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final storage = FirebaseStorage.instance;
  Future<String> uploadBlogImage(Uint8List file, String blogId) async {
    Reference ref = storage.ref("blogImages").child(blogId);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> deleteBlogImage(String blogId) async {
    storage.ref("blogImages").child(blogId).delete();
  }
}
