import 'package:chatapp/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/widgets/labels.dart';
import 'package:chatapp/widgets/logoImagen.dart';
import 'package:chatapp/widgets/custom_input.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoImagen(titulo: 'Registro',),
                _Form(),
                Labels(
                  titulo: '¿Ya tienes una cuenta?',
                  subtitulo: '¡Ingresa ahora!',
                  ruta: 'login',
                ),
                Text(
                  'Terminos y Condiciones de uso', 
                  style: TextStyle(
                    fontWeight: FontWeight.w200
                  ),
                ),
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre', 
            keyboardType: TextInputType.text,
            textController: nombreCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Email', 
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
             icon: Icons.lock_outline,
             placeHolder: 'Contraseña',
             textController: passCtrl,
             isPassword: true,
          ),
          BotonAzul(
            text: 'Login',
            onPressed: (){},
          )
        ],
      ),
    );
  }
}