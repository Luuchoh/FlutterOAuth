import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarGradient extends StatelessWidget {

 String name;
 IconData icon;

 BarGradient (this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(bottom: 30.0),
     height: 220,
     decoration: BoxDecoration(
      gradient: LinearGradient(
       begin: Alignment.centerRight,
       end: Alignment.topLeft,
       colors: [
        Colors.deepPurple,
        Colors.deepPurple.withOpacity(0.48),
       ],
      ),
      borderRadius: BorderRadius.only(
       bottomLeft: Radius.circular(90),
      ),
     ),
     child: Column(
      children: [
       const Spacer(),
       Align(
        alignment: Alignment.center,
        child: Icon(
         icon,
         size: 90,
         color: Colors.white,
        ),
       ),
       const Spacer(),
       Align(
        alignment: Alignment.bottomRight,
        child: Padding(
         padding: EdgeInsets.only(bottom: 32, right: 32),
         child: Text(
          name,
          style: TextStyle(
           color: Colors.white,
           fontSize: 25,
           letterSpacing: 10,
          ),
         ),
        ),
       )
      ],
     ),
    );
  }

}