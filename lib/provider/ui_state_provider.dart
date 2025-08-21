import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiStateProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void updateIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  bool _hidePass = false;
  bool get hidePass => _hidePass;
  void toggleHidePass() {
    _hidePass = !hidePass;
    notifyListeners();
  }

  Uint8List? _file;
  Uint8List? get file => _file;
  void showImage(Uint8List? image) {
    _file = image;
    notifyListeners();
  }
}
