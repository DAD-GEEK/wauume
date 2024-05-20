import 'package:flutter/material.dart';
import 'package:wauume/views/widgets/LoginWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String background= "images/ImageLogin.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
          child: const LoginWidget(),
        ),
      
    );
  }
}
