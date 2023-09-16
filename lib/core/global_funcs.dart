import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

void printAtConsole(any) {
  if (kDebugMode) {
    print(any);
  }
}
Future<bool> isInstalled() async {
  final val = await WhatsappShare.isInstalled(
      package: Package.whatsapp
  );
  return (val == null)? false:val;
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


extension SnackBarExt on BuildContext {
  void fluidSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(4),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1)),
          // backgroundColor: secondarySwatch.shade800,
          duration: const Duration(seconds: 4),
          padding: EdgeInsets.symmetric(
              vertical: 3, horizontal: 4),
          content: Text(message,

              overflow: TextOverflow.ellipsis)));
  }

}