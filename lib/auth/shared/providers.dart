import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/auth/application/auth_notifier.dart';
import 'package:shopping_list_firebase/auth/infra/firebaseAuth_services.dart';
import 'package:shopping_list_firebase/core/shared/providers.dart';

final firebaseAuthServicesProvider = Provider<FirebaseAuthServices>(
  (ref) {
    return FirebaseAuthServices(
      ref.watch(firebaseAuthProvider),
    );
  },
);

final firebaseAuthStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, User?>(
  (ref) {
    return AuthNotifier(
      null,
      ref.watch(firebaseAuthServicesProvider),
    );
  },
);
