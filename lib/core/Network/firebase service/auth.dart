
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User{
  final String uid;

  User({required this.uid});
}

class AuthBase {

  Future<User?> login(String email, String password) async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword
         (email: email, password: password);
    }
    catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
    return null;
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}