import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wauume/controllers/login/LoginController.dart';
import 'package:wauume/controllers/login/firebase_service.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/Container.dart';
import 'package:wauume/views/widgets/FormField.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _key = GlobalKey();

  bool _passwordVisible = false;
  String labelEmail = "Correo";
  String labelPassword = "Contraseña";
  String email = "";
  String password = "";
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Logo Wauume
              newLogo(250, 200),
              //Container con widgets
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 570),
                    decoration: containerBoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '¡Bienvenido!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 36),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Inicia sesión con tu correo y contraseña',
                              textAlign: TextAlign.center,
                              style: textStyle(),
                            ),
                          ),
                          //Formulario
                          Form(
                            key: _key,
                            child: Column(
                              children: [
                                //Email
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                        onChanged: (valor) {
                                          email = valor;
                                        },
                                        controller:
                                            TextEditingController(text: email),
                                        validator: validEmailFormtype,
                                        style: textStyle(),
                                        keyboardType:
                                            assignTextInputType(labelEmail),
                                        autofillHints:
                                            assignAutoFillHints(labelEmail),
                                        decoration: decorationTextFormField(
                                            labelEmail)),
                                  ),
                                ),
                                //Password
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      obscureText: !_passwordVisible,
                                      onChanged: (valor) {
                                        password = valor;
                                      },
                                      controller:
                                          TextEditingController(text: password),
                                      validator: validPasswordFormType,
                                      style: textStyle(),
                                      keyboardType:
                                          assignTextInputType(labelPassword),
                                      autofillHints:
                                          assignAutoFillHints(labelPassword),
                                      decoration: InputDecoration(
                                        labelText: labelPassword,
                                        labelStyle: labelStyle(),
                                        enabledBorder: enabledBorder(),
                                        border: const OutlineInputBorder(),
                                        focusedBorder: focusedBorder(),
                                        errorBorder: errorBorder(),
                                        focusedErrorBorder:
                                            focusedErrorBorder(),
                                        filled: true,
                                        fillColor: const Color(0xFFF1F4F8),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: const Color(0xFF57636C),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Boton Iniciar Sesion
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: ElevatedButton(
                                      onPressed: () => {
                                            login(_key, context,
                                                email: email,
                                                password: password)
                                          },
                                      style: assigButtonStyle(),
                                      child: Text('Iniciar Sesión',
                                          style: assignTextStyleButton())),
                                ),
                              ],
                            ),
                          ),
                          //Olvidaste tu contraseña
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () => loadNewPage(
                                        context, 'ForgotPassword'),
                                    child: Text(
                                      '¿Olvidaste tu contraseña?',
                                      style: assignTextStyleButton(),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'o con',
                                style: assignTextStyleButton(),
                              ),
                            ],
                          ),
                          //Botones Google y Registrarse
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 10, 16, 10),
                            child: ElevatedButton.icon(
                                onPressed: () async {
                                  UserCredential userCredential = await signInWithGoogle();
                                  print(userCredential) ;
                                  loadNewPage(context, 'Home');
                                                                },
                                style: assignButtonStyleGoogle(),
                                icon: const FaIcon(FontAwesomeIcons.google,
                                    color: Color(0xC4DB3503)),
                                label: Text(
                                  ' Continua con Google',
                                  style: textStyle(),
                                )),
                          ),
                          newTextButton(context, 'Registrate Ahora!',
                              "SignUp", "Signup"),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
