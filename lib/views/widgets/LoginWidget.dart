import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/TextFormField.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

const String logo =
    'https://www.wauume.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo-wauume.3379dc95.png&w=640&q=75';

class _LoginWidgetState extends State<LoginWidget> {
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
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  logo,
                  fit: BoxFit.contain,
                  width: 300,
                  height: 250,
                ),
              ),
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
                          createTextFormField('Correo'),
                          createTextFormField('Contraseña'),
                          newElevatedButtonBlack(
                              context, 'Iniciar Sesión', "Home"),
                          Column(
                            children: [
                              newTextButton(context, '¿Olvidaste tu contraseña?', 'ForgotPassword', false),
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
                                onPressed: () => loadNewPage(context, 'Home'),
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
                          newTextButton(context,'Registrate Ahora!', "SignUp",true),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }



  
}
