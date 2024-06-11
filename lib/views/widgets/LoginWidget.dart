import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wauume/controllers/LoginController.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/FormField.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
  
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _passwordVisible = false;
  String labelEmail = "Correo";
  String labelPassword = "Contraseña";
  String email = "";
  String password = "";
  GlobalKey<FormState> _key = GlobalKey();
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
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xccffffff),
                          Color.fromARGB(168, 233, 80, 34)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '¡Bienvenido!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF101213)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Inicia sesión con tu correo y contraseña',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF101213)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                  onChanged: (valor) {
                                    email = valor;
                                  },
                                  style: textStyle(),
                                  autofocus: true,
                                  validator: validTextFormtype,
                                  keyboardType: assignTextInputType(labelEmail),
                                  autofillHints:
                                      assignAutoFillHints(labelEmail),
                                  decoration: decoration(labelEmail)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                obscureText: !_passwordVisible,
                                onChanged: (valor) {
                                  password = valor;
                                },
                                style: textStyle(),
                                autofocus: true,
                                validator: validTextFormtype,
                                keyboardType:
                                    assignTextInputType(labelPassword),
                                autofillHints:
                                    assignAutoFillHints(labelPassword),
                                decoration: InputDecoration(
                                  labelText: labelPassword,
                                  labelStyle: labelStyle(),
                                  enabledBorder: enabledBorder(),
                                  focusedBorder: focusedBorder(),
                                  errorBorder: errorBorder(),
                                  focusedErrorBorder: focusedErrorBorder(),
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
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          newElevatedButtonBlack(_key, context,
                              'Iniciar Sesión', "Home", email, password),
                          Column(
                            children: [
                              newTextButton(
                                  _key,
                                  context,
                                  '¿Olvidaste tu contraseña?',
                                  'ForgotPassword',
                                  ""),
                              const Text('o con',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 14,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 10, 16, 10),
                            child: ElevatedButton.icon(
                                onPressed: () =>
                                    loadNewPage(_key, context, 'Home'),
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(
                                    const Size(double.infinity, 44),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0xFFF1F4F8)),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                icon: const FaIcon(FontAwesomeIcons.google,
                                    color: Color(0xC4DB3503)),
                                label: const Text(' Continua con Google',
                                    style: TextStyle(
                                      color: Color(0xFF101213),
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ))),
                          ),
                          newTextButton(_key, context, 'Registrate Ahora!',
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
