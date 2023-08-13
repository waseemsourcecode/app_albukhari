import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void printAtConsole(any) {
  print(any);
}

void toast(any) {
  Fluttertoast.showToast(
      msg: any,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
