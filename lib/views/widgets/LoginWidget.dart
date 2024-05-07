import 'package:flutter/material.dart';
import 'package:wauume/views/widgets/TextFormField.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

const String logo =
    'https://www.wauume.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo-wauume.3379dc95.png&w=640&q=75';

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            logo,
            fit: BoxFit.contain,
            width: 300,
            height: 250,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                  )
                ],
                gradient: const LinearGradient(
                  colors: [Color(0xccffffff), Color(0xC4DB3503)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
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
                        ),
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: createTextFormField('Correo'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: createTextFormField('Contraseña'),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
