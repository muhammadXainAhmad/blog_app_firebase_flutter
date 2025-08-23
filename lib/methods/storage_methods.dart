import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  Future<String> uploadBlogImage(Uint8List file, String blogId) async {
    Reference ref = FirebaseStorage.instance.ref("blogImages").child(blogId);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
