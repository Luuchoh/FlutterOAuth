import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Common/TransitionApp.dart';
import 'package:flutter_oauth/Common/Validate.dart';
import 'package:flutter_oauth/HttpProtocol/Status.dart';
import 'package:flutter_oauth/Model/Count.dart';
import 'package:flutter_oauth/Model/User.dart';
import 'package:flutter_oauth/Pages/SignUpPage.dart';
import 'package:flutter_oauth/Widgets/ResetPasswordDialog.dart';

import 'package:flutter_oauth/Widgets/BarGradient.dart';
import 'package:flutter_oauth/Widgets/ButtonBase.dart';
import 'package:flutter_oauth/Widgets/ProgressDialog.dart';
import 'package:flutter_oauth/Widgets/SnackBarApp.dart';
import 'package:flutter_oauth/Widgets/TextFieldBase.dart';
import 'package:flutter_oauth/Widgets/TextMessage.dart';

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
              child: ButtonBase('Iniciar Sesión', () => login(context),),
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

  login(BuildContext context) async{
    // {
    //   "sub": "auth0|6434ca49d49e0116b497212f",
    // "nickname": "luuchoh.02",
    // "name": "luuchoh.02@gmail.com",
    // "picture": "https://s.gravatar.com/avatar/3d63d4cf6c0e0a61b5294e3738ebd92f?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Flu.png",
    // "updated_at": "2023-04-11T02:47:37.624Z"
    // }

    showProgress(context);

    var count = await Count().login('luuchoh.02@gmail.com', 'Luishernandez.02');
    
    // print("count login id = ${count.id} REFRESH= ${count.refreshToken} ACCESS = ${count.accessToken} CREATE = ${count.createdAt} EXPIRES IN = ${count.expiresIn} EXPIRES_TIME = ${count.expiresTime} TYPE = ${count.tokenType}");

    if(Validate.isNotStatus(count)){
      var user = await User().getUserServer();
      if(Validate.isNotStatus(user)){
        TransitionApp.closePageOrDialog(context);
      } else
        error(count, context);
    } else
      error(count, context);


    // TransitionApp.openPage(context, LoadingPage());
  }

  error(Status status,BuildContext context) {
    TransitionApp.closePageOrDialog(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBarApp(
      Validate.isWrongEmailPassword(status.response)
          ? TextMessage("Usuario o Contraseña Incorrecto")
          : status.statusWidget
    ));
  }

  Future<void> showProgress(BuildContext context) async{
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ProgressDialog();
      }
    );
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