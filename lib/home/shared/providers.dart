// ignore_for_file: invalid_use_of_protected_member

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/core/shared/exceptions.dart';
import 'package:shopping_list_firebase/core/shared/providers.dart';
import 'package:shopping_list_firebase/home/application/item_notifier.dart';
import 'package:shopping_list_firebase/home/domain/item_model.dart';
import 'package:shopping_list_firebase/home/infra/item_services.dart';

final itemListExceptionProvider = StateProvider<CustomException?>(
  (ref) {
    return null;
  },
);

final itemServicesProvider = Provider<ItemServices>(
  (ref) {
    return ItemServices(
      ref.watch(firebaseFireStoreProvider),
    );
  },
);

final itemServicesNotifierProvider =
    StateNotifierProvider<ItemNotifier, AsyncValue<List<Item>>>(
  (ref) {
    List<Item> items = [];
    final user = ref.watch(firebaseAuthProvider).currentUser;
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        items =
            await ref.watch(itemServicesProvider).getItems(userId: user!.uid);
      },
    );
    return ItemNotifier(
      AsyncValue.data(items),
      user?.uid,
      ref.watch(itemServicesProvider),
      ref,
    );
  },
);
