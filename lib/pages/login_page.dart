import 'package:chatapp/helpers/mostrar_alerta.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/widgets/labels.dart';
import 'package:chatapp/widgets/logoImagen.dart';
import 'package:chatapp/widgets/custom_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.92,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoImagen(titulo: 'Messenger'),
                _Form(),
                Labels(
                  titulo: '¿No tienes cuenta?', 
                  subtitulo: '¡Crea una ahora!',
                  ruta: 'register',
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

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
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
            onPressed: authService.autenticando ? null : () async {
              FocusScope.of(context).unfocus();

              final loginOK = await authService.login(
                emailCtrl.text.trim(), 
                passCtrl.text.trim()
              );

              if(loginOK){
                
                Navigator.pushReplacementNamed(
                  context, 
                  'usuarios'
                );

              } else {
                mostrarAlerta(
                  context, 
                  'Login erroneo', 
                  'Revisa los datos introducidos'
                );
              }
            },
          )
        ],
      ),
    );
  }
}