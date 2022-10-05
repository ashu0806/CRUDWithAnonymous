// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

abstract class AbFirebaseAuthServices {
  Stream<User?> get authStateChanges;
  Future<void> signInAnonymously();
  User? getCurrentUser();
  Future<void> signOut();
}
