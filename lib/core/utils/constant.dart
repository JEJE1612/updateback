import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const primarycolor = Colors.blue;
const scoundColor = Color(0xff05042C);
String emailAdimin = "consultme455@gmail.com";
String passwordAdmin = "000000";

Future<bool?> tost({
  required text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastState { succes, eror, waring }

Color chooseColor(ToastState state) {
  Color? color;
  switch (state) {
    case ToastState.succes:
      color = Colors.green;
      break;
    case ToastState.eror:
      color = Colors.red;
      break;
    case ToastState.waring:
      color = Colors.amber;
      break;
  }
  return color;
}
