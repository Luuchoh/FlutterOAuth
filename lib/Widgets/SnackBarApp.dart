import 'package:flutter/material.dart';

class SnackBarApp extends SnackBar {

  Widget? widget;

  SnackBarApp(this.widget): super(
    backgroundColor: Colors.deepPurple,
    content: widget!,
    duration: const Duration(seconds: 5)
  );

}