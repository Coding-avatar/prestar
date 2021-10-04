import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prestar/constants/shared_preference_constants.dart';
import 'package:prestar/models/api_models/mongoUser.dart';
import 'package:prestar/services/HttpService.dart';
import 'package:prestar/views/custom_widgets/errorDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<User?> signInWithGoogle();

  Future<User?> createUserWithEmailAndPassword(String email, String password);

  Future<User?> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> storeMongoDbUserUid(String value) async {
    print('Storing Mongo user uid $value');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Constants.MongoDbUser, value);
  }

  Future<void> storeFirebaseUserUid(String value) async {
    print('Storing Firebase user uid $value');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Constants.FirebaseUserUid, value);
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );

        ///finding user in Database
        HttpService()
            .findUserWithEmail(email: userCredential.user!.email ?? '')
            .then((res) {
          if (res.statusCode == 200) {
            /// user document returned nothing to do
          } else if (res.statusCode == 404) {
            HttpService()
                .registerUserWithGoogle(
                    email: userCredential.user!.email ?? '',
                    name: userCredential.user!.displayName ?? '',
                    emailIsVerified: true,
                    usedGoogleAuth: true)
                .then((res) {
              if (res.statusCode == 200) {
                MongoUser newUser = MongoUser.fromJson(jsonDecode(res.body));
                storeMongoDbUserUid(newUser.sId);
              } else {
                ///handle error somehow
              }
            });
          } else {
            ///handle error somehow
          }
        });
        storeFirebaseUserUid(userCredential.user!.uid.toString());
        return userCredential.user;
      } else {
        // ErrorDialog(
        //   errorMessage: 'Missing Google ID Token',
        //   titleText: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
        // );
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
            message: 'Missing Google ID Token');
      }
    } else {
      // ErrorDialog(
      //   errorMessage: 'Sign in aborted by user',
      //   titleText: "ERROR_ABORTED_BY_USER",
      // );
      throw FirebaseAuthException(
          code: "ERROR_ABORTED_BY_USER", message: 'Sign in aborted by user');
    }
  }

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    storeFirebaseUserUid(userCredential.user!.uid.toString());
    return userCredential.user;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    storeFirebaseUserUid(userCredential.user!.uid.toString());
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
