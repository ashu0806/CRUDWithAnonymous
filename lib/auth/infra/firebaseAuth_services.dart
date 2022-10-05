// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list_firebase/auth/domain/ab_firebaseAuth_services.dart';
import 'package:shopping_list_firebase/core/shared/exceptions.dart';

class FirebaseAuthServices extends AbFirebaseAuthServices {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthServices(
    this.firebaseAuth,
  );

  @override
  Stream<User?> get authStateChanges {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<void> signInAnonymously() async {
    try {
      await firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }
}
