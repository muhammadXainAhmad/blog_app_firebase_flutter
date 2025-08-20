import 'package:flutter/material.dart';

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
}
