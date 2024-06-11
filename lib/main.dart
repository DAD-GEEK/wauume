import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wauume/controllers/MascotasProvider.dart';
import 'package:wauume/views/pages/loginPages/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MascotasProvider>(
          create: (context) => MascotasProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Crear un Future para Firebase.initializeApp()
  late Future<FirebaseApp> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Inicializar Firebase en el FutureBuilder
      future: _initialization,
      builder: (context, snapshot) {
        // Comprobar si Firebase se inicializó correctamente
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Login(),
            ),
          );
        }

        // Si Firebase aún no se inicializó, mostrar un CircularProgressIndicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        // Si algo salió mal...
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('Error al inicializar Firebase'),
            ),
          ),
        );
      },
    );
  }
}