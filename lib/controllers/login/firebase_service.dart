import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


//iniciar sesión con google
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );


  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
} 

//cerrar sesión
Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
   ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('cierre de sesión exitoso'),
      duration: Duration(seconds: 1)),
    );
}


//recuperar contraseña
Future<void> resetPassword(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}