
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  Utils._();
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        fontSize: 18,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT);
  }


}
