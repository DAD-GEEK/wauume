import 'package:flutter/material.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/FormField.dart';

class SignUpTwo extends StatefulWidget {
  const SignUpTwo({Key? key}) : super(key: key);

  @override
  State<SignUpTwo> createState() => _SignUpTwoState();
}

class _SignUpTwoState extends State<SignUpTwo> {
  String background = "images/ImageSignup.jpg";
  List<String> typesDocuments = <String>['CC', 'NIT', 'TI', 'PASAPORTE'];
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String typesDocument = typesDocuments.first;
    return Scaffold(
        appBar: AppBar(
          title: newLogo(250, 31),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                        width: double.infinity,
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
                              Color.fromARGB(119, 219, 53, 3)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  '¡Falta Poco!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 8, 11, 12)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Completa tus datos para continuar y ser un Wauumer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF101213)),
                                ),
                              ),
                              createDropDownMenu(typesDocument),
                              createTextFormField('Tipo de Documento'),
                              createTextFormField('Numero de Identificacion'),
                              createTextFormField('Direccion de Residencia'),
                              createTextFormField('Departamento'),
                              createTextFormField('Ciudad'),
                              createTextFormField('Fecha de Nacimiento'),
                              newTextButton(
                                  context, 'Ingresa Aqui', 'Login', "Register"),
                              newElevatedButtonBlack(
                                  _key, context, 'Crear Cuenta', 'Home'),
                            ]))),
                  )
                ]),
          ),
        ));
  }

  DropdownMenu<String> createDropDownMenu(String typesDocument) {
    return DropdownMenu<String>(
      hintText: 'Tipo de Documento',
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            color: Color(0xFF57636C),
            fontSize: 16,
            fontWeight: FontWeight.w500),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF101213)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF101213)),
        ),
      ),
      onSelected: (String? value) {
        setState(() {
          typesDocument = value!;
        });
      },
      dropdownMenuEntries:
          typesDocuments.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
