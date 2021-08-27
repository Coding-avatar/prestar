import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyUser {
  final String uid;
  final String photoUrl;
  final String displayName;
  MyUser(
      {required this.uid,
        required this.photoUrl,
        required this.displayName});
}

abstract class AuthBase {
  Stream<MyUser> get onAuthStateChanged;
  MyUser currentUser();
  Future<MyUser> signInAnonymously();
  Future<void> signOut();
  Future<MyUser> signInWithGoogle();
  // Future<MyUser> signInWithFacebook();
  Future<MyUser> signInWithEmailandPassword(String email, String password);
  Future<MyUser> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<void> resetPassword(String email);
}

class Auth implements AuthBase {
  late SharedPreferences _preferences;
  final _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference userReference =
  FirebaseFirestore.instance.collection('users');
  createUser({uid, name, photoUrl, email}) async {
    await userReference
        .doc(uid)
        .set({'fullname': name, 'photoUrl': photoUrl, 'email': email});
    await _preferences.setString('username', name);
    await _preferences.setString('photoUrl', photoUrl);
    await _preferences.setString('uid', uid);
  }

  MyUser? _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    createUser(
        email: user.email == null ? '' : user.email,
        name: user.displayName == null ? 'Guest' : user.displayName,
        photoUrl: user.photoURL == null
            ? 'https://cdn.iconscout.com/icon/free/png-512/account-profile-avatar-man-circle-user-30452.png'
            : user.photoURL,
        uid: user.uid);
    return MyUser(
        uid: user.uid, photoUrl: user.photoURL??'', displayName: user.displayName??'');
  }

  @override
  Stream<MyUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  MyUser currentUser() {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<MyUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token');
      }
    } else {
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
    }
  }

  // @override
  // Future<MyUser> signInWithFacebook() async {
  //   final facebookLogin = FacebookLogin();
  //   final result = await facebookLogin.logIn(['public_profile']);
  //   print(result.errorMessage);
  //   if (result.accessToken != null) {
  //     final authResult = await _firebaseAuth.signInWithCredential(
  //       FacebookAuthProvider.credential(result.accessToken.token),
  //     );
  //     return _userFromFirebase(authResult.user);
  //   } else {
  //     throw PlatformException(
  //         code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
  //   }
  // }

  @override
  Future<MyUser> signInWithEmailandPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<MyUser> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    authResult.user.updateProfile(displayName: name);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove('uid');
    _preferences.remove('username');
    _preferences.remove('photoUrl');
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    // final facebookLogin = FacebookLogin();
    // await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
