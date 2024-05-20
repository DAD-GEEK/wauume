import 'package:flutter/material.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/TextFormField.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String background= "images/ImageForgotPassword.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
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
                                colors: [Color(0xccffffff), Color.fromARGB(143, 219, 53, 3)],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Recuperar contraseña',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 8, 11, 12)),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213)),
                                    ),
                                  ),
                                  createTextFormField('Correo'),
                                  newElevatedButtonBlack(context, 'Enviar', 'Login'),
                                ]))),
                      )
                    ]),
              ),
            )));
  }
}
