import 'package:firebase_auth/firebase_auth.dart';

class Userr{
  final String uid;

  Userr({required this.uid});
}

class AuthBase {

  Future<Userr?> login(String email, String password) async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword
         (email: email, password: password);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}