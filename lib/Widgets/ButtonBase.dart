import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {

  String name;
  var onTap;
  double width;

  ButtonBase(this.name, this.onTap, {this.width = 0});


  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          padding: EdgeInsets.all(10),
          width: width > 0 ? width : null,
          decoration: BoxDecoration(
            color: Colors.deepPurple[400],
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Center(
            child: Text(
              name.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
  }

}