import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Common/TransitionApp.dart';
import 'package:flutter_oauth/Widgets/ButtonBase.dart';
import 'package:flutter_oauth/Widgets/TextFieldBase.dart';

class ResetPasswordDialog extends StatelessWidget {

  TextEditingController ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldBase("Correo", Icons.email_outlined, controller: ctrlEmail,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ButtonBase("Cancelar", () => close(context)),
                  ButtonBase("Restablecer", () => reset()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  close(BuildContext context) {
    TransitionApp.closePageOrDialog(context);
  }

  reset() {

  }

}