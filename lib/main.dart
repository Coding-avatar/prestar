import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:prestar/services/auth.dart';
import 'package:prestar/services/auth_provider.dart';
import 'package:prestar/views/screens/Home/HomeScreen.dart';
import 'package:prestar/views/screens/Login/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/shared_preference_constants.dart';

void main() async {
  /// Ensures that widget binding is complete
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializing Firebase app
  await Firebase.initializeApp();
  handleNotifs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// AuthProvider is an inherited widget to provide auth services to different widgets
    /// You can make use of the Auth.of(context) to access auth methods from lib/services/auth.dart
    return AuthProvider(
      /// Instance of Auth class
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
          textTheme: buildTextTheme(),
        ),
        home: RedirectUser(),
      ),
    );
  }

  TextTheme buildTextTheme() {
    return const TextTheme(
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
    );
  }
}

///redirects user to Login or Homepage based on the status of Firebase AuthStateChanges stream
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
          return HomeScreen(user.email ?? '');
        }

        /// default view when Firebase AuthStateChanges stream has not started emitting any values
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

Future<void> handleNotifs() async {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? fcmToken = await _firebaseMessaging.getToken();
  print('FCM Token: $fcmToken');

  SharedPreferences.getInstance().then((sharedPrefs) {
    sharedPrefs.setString(Constants.SHARED_PREF_FCM_TOKEN, fcmToken!);
  });

  FirebaseMessaging.onMessage.listen((remoteMessage) {
    Map<String, dynamic> messageMap = remoteMessage.data;
    print('Message received in onMessage');
  });

  // Future.delayed(Duration(seconds: 2), () {
  //   FirebaseMessaging.onBackgroundMessage((message) {
  //     Map<String, dynamic> messageMap = message.data;
  //     print('Message received in background');
  //     return;
  //   });
  // });

  // _firebaseMessaging.configure(
  //   onMessage: (Map<String, dynamic> message) async {
  //     print("onMessage: $message");
  //   },
  //   onBackgroundMessage: backgroundMessageHandler,
  //   onLaunch: (Map<String, dynamic> message) async {
  //     print("onLaunch: $message");
  //   },
  //   onResume: (Map<String, dynamic> message) async {
  //     print("onResume: $message");
  //   },
  // );
}
