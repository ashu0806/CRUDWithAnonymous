import 'package:shopping_list_firebase/home/domain/item_model.dart';

abstract class AbItemServices {
  Future<List<Item>> getItems({
    required String userId,
  });
  Future<String> createItem({
    required String userId,
    required Item item,
  });
  Future<void> updateItem({
    required String userId,
    required Item item,
  });
  Future<void> deleteItem({
    required String userId,
    required String itemId,
  });
}
