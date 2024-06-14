import 'package:flutter/material.dart';
import 'package:wauume/controllers/login/LoginController.dart';
import 'package:wauume/views/widgets/FormField.dart';

Padding newElevatedButtonBlack(
    GlobalKey<FormState> _key, BuildContext context, String text, String page,
    [String email = "", String password = ""]) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
    child: ElevatedButton(
      onPressed: () {
        loadNewPage(_key, context, page);
      },
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

Row newTextButton(GlobalKey<FormState> _key, BuildContext context, String text,
    String page, String option) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (option == "Signup") const Text("¿No tienes una cuenta?"),
      if (option == "Register") const Text("¿Ya tienes una cuenta?"),
      TextButton(
        onPressed: () => loadNewPage(_key, context, page),
        child: Text(
          text,
          style: assignTextStyleButton(),
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

AppBar Appbar() {
  return AppBar(
      title: newLogo(250, 31),
      leading: IconButton(
        icon: Icon(Icons.notifications_none_outlined),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {},
        ),
      ]);
}

assigButtonStyle() {
  return ButtonStyle(
    minimumSize: WidgetStateProperty.all(
      const Size(double.infinity, 44),
    ),
    backgroundColor: WidgetStateProperty.all(const Color(0xFF14171A)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

  ButtonStyle assignButtonStyleGoogle() {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        const Size(double.infinity, 44),
      ),
      backgroundColor: WidgetStateProperty.all(const Color(0xFFF1F4F8)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }