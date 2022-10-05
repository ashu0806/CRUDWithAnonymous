import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/core/shared/exceptions.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) {
    return FirebaseAuth.instance;
  },
);

final firebaseFireStoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);

