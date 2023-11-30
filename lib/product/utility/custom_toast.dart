import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final class CustomToast {
  CustomToast._();

  static void showToast(String message) {
    // TO DO renkleri dışarı çıkar temadan sonra
    Fluttertoast.showToast(
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      msg: message,
    );
  }
}
