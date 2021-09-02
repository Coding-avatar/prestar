import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prestar/views/screens/LoginScreen.dart';
import 'package:prestar/views/screens/PasswordResetOtpScreen.dart';
import 'package:prestar/views/screens/ProfileScreen.dart';
import 'package:prestar/views/screens/RecoverPasswordScreen.dart';
import 'package:prestar/views/screens/RegisterOtpScreen.dart';
import 'package:prestar/views/screens/RegisterScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prestar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ProfileScreen(),
    );
  }
}
