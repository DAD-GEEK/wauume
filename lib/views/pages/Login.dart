import 'package:flutter/material.dart';
import 'package:wauume/views/widgets/LoginWidget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String background =
      'https://images.unsplash.com/photo-1505628346881-b72b27e84530?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxwZXR8ZW58MHx8fHwxNzEyNTk4ODAxfDA&ixlib=rb-4.0.3&q=80&w=1080';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(background).image,
          fit: BoxFit.cover,
        ),
      ),
      child: LoginWidget(),
    ));
  }
}
