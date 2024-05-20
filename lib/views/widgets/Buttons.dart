import 'package:flutter/material.dart';
import 'package:wauume/views/pages/ForgotPassword.dart';
import 'package:wauume/views/pages/Home.dart';
import 'package:wauume/views/pages/SignUp.dart';
import 'package:wauume/views/pages/SignUpTwo.dart';

Padding newElevatedButtonBlack(BuildContext context, String text, String page) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
    child: ElevatedButton(
      onPressed: () => loadNewPage(context, page),
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 44),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xFF14171A)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Text(text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          )),
    ),
  );
}

Row newTextButton(BuildContext context, String text, String page, String option) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (option == "Signup") const Text("¿No tienes una cuenta?"),
      if(option == "Register") const Text("¿Ya tienes una cuenta?"),
      TextButton(
        onPressed: () => loadNewPage(context, page),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

Text newText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 14,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w600,
    ),
  );
}

loadNewPage(BuildContext context, String page) {
  final pageRoutes = {
    'SignUp': () => const SignUp(),
    'Home': () => const Home(),
    'ForgotPassword': () => const ForgotPassword(),
    'SignUpTwo' : () => const SignUpTwo(),
  };

  if (pageRoutes.containsKey(page)) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => pageRoutes[page]!(),
      ),
    );
  } else {
    throw Exception('Invalid page: $page');
  }
}

ClipRRect newLogo(double width, double height) {
  const String logo =
    'https://www.wauume.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo-wauume.3379dc95.png&w=640&q=75';
  return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        logo,
        fit: BoxFit.contain,
        width: width,
        height: height,
      ),
    );
}
