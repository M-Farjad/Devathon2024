import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prep_master/firebase_options.dart';
import 'package:prep_master/utils/exception_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:prep_master/headers.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
String? userEmail;
String? imageUrl;

Future<User?> signInWithGoogle() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  User? user;

  if (kIsWeb) {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(googleProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
  } else {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          log(e.toString());
          ExceptionHandler.handleException(e);
        } else if (e.code == 'invalid-credential') {
          log(e.toString());
          ExceptionHandler.handleException(e);
          // handle the error here
        }
      } catch (e) {
        log(e.toString());
        // handle the error here
        ExceptionHandler.handleException(e);
      }
    }
  }
  if (user != null) {
    userName = user.displayName;
    uid = user.uid;
    userEmail = user.email;
    imageUrl = user.photoURL;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
    return user;
  }
  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  await _auth.signOut();
  userName = null;
  uid = null;
  userEmail = null;
  imageUrl = null;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
}

final _auth = FirebaseAuth.instance;

String? uid;
String? userName;

Future<User?> registerWithEmailPassword(
    {required String email, required String password}) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  User? user;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;
    if (user != null) {
      // userName = user.displayName;
      uid = user.uid;
      userEmail = user.email;
      // imageUrl = user.photoURL;
      return user;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      log('The password provided is too weak.');
      ExceptionHandler.handleException(e);
    } else if (e.code == 'email-already-in-use') {
      log('The account already exists for that email.');
      ExceptionHandler.handleException(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return user;
}

Future<User?> signInWithEmailPassword(String email, String password) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  User? user;
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;
    if (user != null) {
      // userName = user.displayName;
      uid = user.uid;
      userEmail = user.email;
      // imageUrl = user.photoURL;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      return user;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log('No user found for that email.');
      ExceptionHandler.handleException(e);
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided for that user.');
      ExceptionHandler.handleException(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return user;
}

Future<void> signOut() async {
  await _auth.signOut();
  userName = null;
  uid = null;
  userEmail = null;
  imageUrl = null;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
}
