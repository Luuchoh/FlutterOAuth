import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Common/TransitionApp.dart';
import 'package:flutter_oauth/Pages/SignUpPage.dart';
import 'package:flutter_oauth/Widgets/ResetPasswordDialog.dart';

import '../Widgets/BarGradient.dart';
import '../Widgets/ButtonBase.dart';
import '../Widgets/TextFieldBase.dart';

class LoginPage extends StatelessWidget{

  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Cake Shop", Icons.store),
            TextFieldBase('Usuario',Icons.person, controller: ctrlEmail),
            TextFieldBase('Contraseña',Icons.remove_red_eye_rounded, obscureText: true, controller: ctrlPass),
            InkWell(
              onTap: () => resetPassword(context),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 32, top: 16),
                  child: Text(
                    '¿Se te olvido la contraseña?',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: ButtonBase('Iniciar Sesión', () => login(),),
            ),
            InkWell(
              // child: RichText(
              //   text: TextSpan(
              //     text: '¿No tienes una cuenta?',
              //     style: TextStyle(
              //       color: Colors.black,
              //     ),
              //     children: [
              //       TextSpan(
              //         text: ' Crear cuenta',
              //         style: TextStyle(
              //           color: Colors.deepPurple[400],
              //           fontWeight: FontWeight.bold,
              //           decoration: TextDecoration.underline,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              onTap: () => signUp(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta?',
                  ),
                  Text(
                    ' Crear Cuenta',
                    style: TextStyle(
                      color: Colors.deepPurple[300]
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  login() {

  }

  signUp(BuildContext context) {
    TransitionApp.openPage(context, SignUpPage());
  }

  Future<void> resetPassword(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return ResetPasswordDialog();
      }
    );
  }

}