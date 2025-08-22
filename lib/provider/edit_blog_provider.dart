import 'package:flutter/material.dart';

class EditBlogProvider with ChangeNotifier {
  bool _isUpdate = false;
  String? _blogId;
  String? _title;
  String? _content;
  String? _imageUrl;

  bool get isUpdate => _isUpdate;
  String? get blogId => _blogId;
  String? get title => _title;
  String? get content => _content;
  String? get imageUrl => _imageUrl;

  void setUpdate(
    bool update, {
    String? blogId,
    String? title,
    String? content,
    String? imageUrl,
  }) {
    _isUpdate = update;
    _blogId = blogId;
    _title = title;
    _content = content;
    _imageUrl = imageUrl;
    notifyListeners();
  }

  void clear() {
    _isUpdate = false;
    _title = null;
    _content = null;
    _imageUrl = null;
    notifyListeners();
  }
}
