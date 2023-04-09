import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SimpleDialog(
        children: [
          Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color> (
                      Colors.deepPurple
                  ),
                ),
                Text(
                  'Por favor espere...',
                  style: TextStyle(
                    color: Colors.deepPurple[600]
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      onWillPop: () async => false
    );
  }

}