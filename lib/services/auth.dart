import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<User?> signInAnonymously();

  Future<User?> signInWithGoogle();

  Future<User?> createUserWithEmailAndPassword(String email, String password);

  Future<User?> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference userReference =
      FirebaseFirestore.instance.collection('users');

  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  // @override
  // Future<User> signInWithPhoneNumber(String phoneNumber) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+91 $phoneNumber',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       UserCredential userCredential =
  //           await FirebaseAuth.instance.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {},
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

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
        createUserInDataBase(
            uid: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? '',
            dob: DateTime(2008),
            gender: '',
            email: userCredential.user!.email ?? '',
            phone: userCredential.user!.phoneNumber ?? '');
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
            message: 'Missing Google ID Token');
      }
    } else {
      throw FirebaseAuthException(
          code: "ERROR_ABORTED_BY_USER", message: 'Sign in aborted by user');
    }
  }

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> createUserInDataBase({
    required String uid,
    required String name,
    required DateTime dob,
    required String gender,
    required String email,
    required String phone,
  }) async {
    await userReference.doc(uid).set({
      'name': name,
      'dob': dob,
      'gender': gender,
      'email': email,
      'phone': phone,
    });
  }
}
