import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserF {
  String? uid;
  String? email;
  String? profileImageUrl;
  String? name;
  String? brainTumorImage;
  String? pneumoniaImage;
  UserF({this.uid, this.email, this.name, this.brainTumorImage, this.pneumoniaImage, this.profileImageUrl});

  factory UserF.fromFirebase(UserF firebaseUser) {
    return UserF(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
    );
  }
  factory UserF.fromDocument(DocumentSnapshot doc) {
    return UserF(
      uid: doc['uid'],
      email: doc['email'],
      name: doc['name'],
      brainTumorImage: doc['image_url_brain_tumor'],
      pneumoniaImage: doc['image_url_pneumonia'],
      profileImageUrl: doc['profile_image_url'],
    );
  }

}

class AuthBase {
  Future<User?> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
    return null;
  }

  Future<User?> register(String email, String password, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'uid': user.uid,
          'email': user.email,
          'image_url_pneumonia': null,
          'image_url_brain_tumor': null,
          'profile_image_url': null,
          'password': password,
        });
      }
      return user!;
    }
      catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<DocumentSnapshot<Object?>?> getUserData(String uid) async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    if (snapshot.exists) {
      return snapshot;
    } else {
      return null;
    }
  }

  Future<UserF?> googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set({
          'email': value.user!.email,
          'name': value.user!.displayName,
          'profile_image_url': value.user!.photoURL,
          'uid': value.user!.uid,
          'image_url_pneumonia': null,
          'image_url_brain_tumor': null,
        });
      });
    } catch (e) {
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
