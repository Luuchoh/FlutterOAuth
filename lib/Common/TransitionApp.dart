import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Model/Count.dart';
import 'package:flutter_oauth/Model/User.dart';
import 'package:flutter_oauth/main.dart';

class TransitionApp {

  static closePageOrDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static openPage(BuildContext context, var page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static goMain(BuildContext context, {Count? count, User? user}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp(count: count, user: user,)),
        ModalRoute.withName("/MyApp")
    );
  }
}