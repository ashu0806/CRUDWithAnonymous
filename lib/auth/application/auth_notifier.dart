import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/auth/infra/firebaseAuth_services.dart';

class AuthNotifier extends StateNotifier<User?> {
  final FirebaseAuthServices services;
  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthNotifier(
    super.state,
    this.services,
  ) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = services.authStateChanges.listen(
      (user) => state = user,
    );
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void appStarts() async {
    final user = services.getCurrentUser();
    if (user == null) {
      await services.signInAnonymously();
    }
  }

  void signOut() async {
    await services.signOut();
  }
}
