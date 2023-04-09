import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oauth/Common/TransitionApp.dart';
import 'package:flutter_oauth/Widgets/BarGradient.dart';
import 'package:flutter_oauth/Widgets/ButtonBase.dart';
import 'package:flutter_oauth/Widgets/TextFieldBase.dart';

class SignUpPage extends StatelessWidget {

  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlUser = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BarGradient("Crear Cuenta", Icons.person_add_alt_1_rounded),
              TextFieldBase("Nombre", Icons.person_sharp, controller: ctrlName,),
              TextFieldBase("Usuario", Icons.person_pin, controller: ctrlUser,),
              TextFieldBase("Email", Icons.alternate_email, controller: ctrlEmail,),
              TextFieldBase("Contraseña", Icons.remove_red_eye_rounded, controller: ctrlPassword,),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: ButtonBase('Crear Cuenta', () => signUp(),),
              ),
              InkWell(
                onTap: () => TransitionApp.closePageOrDialog(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Tienes una cuenta?',
                    ),
                    Text(
                      ' Iniciar sesión ',
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
      ),
    );
  }

  signUp() {

  }

}