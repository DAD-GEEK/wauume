import 'package:flutter/material.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/FormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String background= "images/ImageSignup.jpg";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: newLogo(250,31),
          elevation: 0,
            ),
        body:   Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                )
                              ],
                              gradient: const LinearGradient(
                                colors: [Color(0xccffffff), Color.fromARGB(119, 219, 53, 3)],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      '¡Registrate!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 8, 11, 12)),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'Registrate en Wauu!me, \n es Completamente Gratis',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213)),
                                    ),
                                  ),
                                  createTextFormField('Nombres'),
                                  createTextFormField('Apellidos'),
                                  createTextFormField('Correo'),
                                  createTextFormField('Contraseña'),
                                  createTextFormField('Confirmar Contraseña'),
                                  createTextFormField('Celular'),
                                  newTextButton(context, 'Ingresa Aqui', 'Login', "Register"),
                                  newElevatedButtonBlack(context, 'Continuar', 'SignUpTwo'),
                                ]))),
                      )
                    ]),
              ),
            )
    );
  }
}
