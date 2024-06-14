import 'package:flutter/material.dart';
import 'package:wauume/controllers/ForgotController.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/Container.dart';
import 'package:wauume/views/widgets/FormField.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String labelEmail = "Correo";
  String email = "";
  String background = "images/ImageForgotPassword.jpg";
  final GlobalKey<FormState> _key = GlobalKey();
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
                            decoration: containerBoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(children: [
                                const Text(
                                  'Recuperar contraseña',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 8, 11, 12)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.',
                                    textAlign: TextAlign.center,
                                    style: assignTextStyleButton(),
                                  ),
                                ),
                                Form(
                                    key: _key,
                                    child: Column(children: [
                                      //Email
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 16),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                              onChanged: (valor) {
                                                email = valor;
                                              },
                                              controller: TextEditingController(
                                                  text: email),
                                              validator: validEmailFormtype,
                                              style: textStyle(),
                                              keyboardType: assignTextInputType(
                                                  labelEmail),
                                              autofillHints:
                                                  assignAutoFillHints(
                                                      labelEmail),
                                              decoration:
                                                  decorationTextFormField(
                                                      labelEmail)),
                                        ),
                                      ),
                                      //Boton enviar correo de recuperación
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 0),
                                        child: ElevatedButton(
                                            onPressed: () => {
                                                  forgotpassword(_key, context,
                                                      email: email)
                                                },
                                            style: assigButtonStyle(),
                                            child: Text(
                                                'Enviar correo de recuperación',
                                                style:
                                                    assignTextStyleButton())),
                                      ),
                                    ]))
                              ]),
                            ))),
                  ]),
            ))));
  }
}
