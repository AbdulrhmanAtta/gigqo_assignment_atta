import 'package:flutter/material.dart';

class ResponseNotifier extends ChangeNotifier {
  String _responseText ='';
  String get responseText => _responseText;

  void updateResponseText (responseText) {

    _responseText = responseText;
    notifyListeners();

  }
}