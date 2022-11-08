import 'package:flutter/cupertino.dart';
import 'package:up_todo/local_data/shared_preference.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = StorageRepository.getBool("isLight");

  setIsLight(bool isLight) async {
    _isLight = isLight;
    await StorageRepository.saveBool("isLight", _isLight);
    notifyListeners();
  }

  getIsLight() {
    return _isLight;
  }
}