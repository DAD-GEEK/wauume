import 'package:flutter/material.dart';
import 'package:wauume/views/pages/ForgotPassword.dart';
import 'package:wauume/views/pages/Home.dart';
import 'package:wauume/views/pages/SignUp.dart';

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

Row newTextButton(BuildContext context, String text, String page,bool isSign) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      if(isSign) const Text ("¿No tienes una cuenta?"),
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
