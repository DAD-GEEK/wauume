import 'package:flutter/material.dart';
import 'package:wauume/controllers/signup/SignUpController.dart';
import 'package:wauume/controllers/usuarios/UserProvider.dart';
import 'package:wauume/views/widgets/Buttons.dart';
import 'package:wauume/views/widgets/Container.dart';
import 'package:wauume/views/widgets/FormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;
  String background = "images/ImageSignup.jpg";
  String name = "";
  String lastname = "  ";
  String email = "";
  String password = "";
  String confirmpassword = "";
  String phone = "";
  String labelName = "Nombres";
  String labelLastName = "Apellidos";
  String labelEmail = "Correo";
  String labelPassword = "Contraseña";
  String labelConfirmPassword = "Confirmar Contraseña";
  String labelCelular = "Celular";
  final SignUpController _signUpController = SignUpController();


  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                        decoration: containerBoxDecoration(),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  '¡Registrate!',
                                  textAlign: TextAlign.center,
                                  style: textStyleTitle(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Registrate en Wauu!me, \n es Completamente Gratis',
                                  textAlign: TextAlign.center,
                                  style: assignTextStyleButton(),
                                ),
                              ),
                              Form(
                                  key: _key,
                                  child: Column(children: [
                                    //nombres
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                            onChanged: (valor) {
                                              name = valor;
                                            },
                                            controller: TextEditingController(
                                                text: name),
                                            validator: _signUpController.validNameFormType,
                                            style: textStyle(),
                                            keyboardType:
                                                assignTextInputType(labelName),
                                            autofillHints:
                                                assignAutoFillHints(labelName),
                                            decoration: decorationTextFormField(
                                                labelName)),
                                      ),
                                    ),
                                    //apellidos
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                            onChanged: (valor) {
                                              email = valor;
                                            },
                                            controller: TextEditingController(
                                                text: email),
                                            validator:_signUpController.validLastNameFormType,
                                            style: textStyle(),
                                            keyboardType: assignTextInputType(
                                                labelLastName),
                                            autofillHints: assignAutoFillHints(
                                                labelLastName),
                                            decoration: decorationTextFormField(
                                                labelLastName)),
                                      ),
                                    ),
                                    //correo
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                            onChanged: (valor) {
                                              email = valor;
                                            },
                                            controller: TextEditingController(
                                                text: email),
                                            validator: _signUpController.validEmailFormtype,
                                            style: textStyle(),
                                            keyboardType:
                                                assignTextInputType(labelEmail),
                                            autofillHints:
                                                assignAutoFillHints(labelEmail),
                                            decoration: decorationTextFormField(
                                                labelEmail)),
                                      ),
                                    ),
                                    //contraseña
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          obscureText: !_passwordVisible,
                                          onChanged: (valor) {
                                            password = valor;
                                          },
                                          controller: TextEditingController(
                                              text: password),
                                          validator: (value) => _signUpController.validPasswordFormType(password, confirmpassword),
                                          style: textStyle(),
                                          keyboardType: assignTextInputType(
                                              labelPassword),
                                          autofillHints: assignAutoFillHints(
                                              labelPassword),
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
                                          ),
                                        ),
                                      ),
                                    ),
                                    //confirmar contraseña
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          obscureText: !_passwordVisible,
                                          onChanged: (valor) {
                                            confirmpassword = valor;
                                          },
                                          controller: TextEditingController(
                                              text: confirmpassword),
                                          validator: (value) => _signUpController.validconfirmPasswordFormType(password, confirmpassword),
                                          style: textStyle(),
                                          keyboardType: assignTextInputType(
                                              labelConfirmPassword),
                                          autofillHints: assignAutoFillHints(
                                              labelConfirmPassword),
                                          decoration: InputDecoration(
                                            labelText: labelConfirmPassword,
                                            labelStyle: labelStyle(),
                                            enabledBorder: enabledBorder(),
                                            border: const OutlineInputBorder(),
                                            focusedBorder: focusedBorder(),
                                            errorBorder: errorBorder(),
                                            focusedErrorBorder:
                                                focusedErrorBorder(),
                                            filled: true,
                                            fillColor: const Color(0xFFF1F4F8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //celular
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                            onChanged: (valor) {
                                              phone = valor;
                                            },
                                            controller: TextEditingController(
                                                text: phone),
                                            validator: _signUpController.validPhoneFormType,
                                            style: textStyle(),
                                            keyboardType: assignTextInputType(
                                                labelCelular),
                                            autofillHints: assignAutoFillHints(
                                                labelCelular),
                                            decoration: decorationTextFormField(
                                                labelCelular)),
                                      ),
                                    ),
                                    newTextButton(context, 'Ingresa Aqui',
                                        'Login', "Register"),
                                    //Boton Continuar
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 16, 0),
                                      child: ElevatedButton(
                                          onPressed: () => {
                                                _signUpController.createUser(
                                                    _key,
                                                    name: name,
                                                    lastname: lastname,
                                                    email: email,
                                                    password: password,
                                                    phone: phone,
                                                    provider: Userprovider(),
                                                    context: context)
                                              },
                                          style: assigButtonStyle(),
                                          child: Text('Crear Cuenta',
                                              style: assignTextStyleButton())),
                                    ),
                                  ]))
                            ])),
                      ))
                ]),
          ),
        ));
  }
}
