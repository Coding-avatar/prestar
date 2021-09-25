import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:prestar/services/auth.dart';
import 'package:prestar/services/auth_provider.dart';
import 'package:prestar/views/screens/Home/HomeScreen.dart';
import 'package:prestar/views/screens/Login/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Prestar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Color(0xfff1eeee),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'Oswald',
              color: Colors.black87,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            button: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            caption: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            overline: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black38,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
            subtitle1: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            subtitle2: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            headline1: TextStyle(
              fontFamily: 'Oswald',
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            headline2: TextStyle(
              fontFamily: 'Oswald',
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        home: RedirectUser(),
      ),
    );
  }
}

class RedirectUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return LoginScreen();
          }
          return HomeScreen();
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/splashScreen.png",
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}

//
// if (user == null) {
// print('User is currently signed out!');
// Navigator.of(context).pushReplacement(
// MaterialPageRoute(
// builder: (context) => LoginScreen(),
// ),
// );
// } else {
// print('User is signed in!');
// Navigator.of(context).pushReplacement(
// MaterialPageRoute(
// builder: (context) => HomeScreen(),
// ),
// );
// }
//
