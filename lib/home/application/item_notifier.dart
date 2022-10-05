import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/core/shared/exceptions.dart';
import 'package:shopping_list_firebase/home/domain/item_model.dart';
import 'package:shopping_list_firebase/home/infra/item_services.dart';
import 'package:shopping_list_firebase/home/shared/providers.dart';

class ItemNotifier extends StateNotifier<AsyncValue<List<Item>>> {
  final String? userId;
  final ItemServices services;
  final Ref ref;

  ItemNotifier(
    super.state,
    this.userId,
    this.services,
    this.ref,
  ) {
    if (userId != null) {
      retrieveItems();
    }
  }

  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) {
      state = const AsyncValue.loading();
    }
    try {
      final items = await services.getItems(
        userId: userId!,
      );
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addItem({
    required String name,
    bool obtained = false,
  }) async {
    try {
      final item = Item(
        name: name,
        obtained: obtained,
      );
      final itemId = await services.createItem(
        userId: userId!,
        item: item,
      );
      state.whenData(
        (items) => state = AsyncValue.data(
          items
            ..add(
              item.copyWith(id: itemId),
            ),
        ),
      );
    } on CustomException catch (e) {
      ref.watch(itemListExceptionProvider.state).state = e;
    }
  }

  Future<void> updateItem({
    required Item updatedItem,
  }) async {
    try {
      await services.updateItem(
        userId: userId!,
        item: updatedItem,
      );
      state.whenData(
        (items) {
          state = AsyncValue.data(
            [
              for (final item in items)
                if (item.id == updatedItem.id) updatedItem else item
            ],
          );
        },
      );
    } on CustomException catch (e) {
      ref.watch(itemListExceptionProvider.state).state = e;
    }
  }

  Future<void> deleteItem({
    required String itemId,
  }) async {
    try {
      await services.deleteItem(
        userId: userId!,
        itemId: itemId,
      );
      state.whenData(
        (items) {
          state = AsyncValue.data(items
            ..removeWhere(
              (item) => item.id == itemId,
            ));
        },
      );
    } on CustomException catch (e) {
      ref.watch(itemListExceptionProvider.state).state = e;
    }
  }
}
