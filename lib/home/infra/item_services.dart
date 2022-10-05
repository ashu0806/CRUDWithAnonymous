import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list_firebase/core/shared/exceptions.dart';
import 'package:shopping_list_firebase/home/domain/ab_item_services.dart';
import 'package:shopping_list_firebase/home/domain/item_model.dart';

class ItemServices extends AbItemServices {
  final FirebaseFirestore firebaseFirestore;

  ItemServices(
    this.firebaseFirestore,
  );
  @override
  Future<List<Item>> getItems({
    required String userId,
  }) async {
    try {
      final snapshot = await firebaseFirestore
          .collection('list')
          .doc(userId)
          .collection('userList')
          .get();
      return snapshot.docs.map((doc) => Item.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }

  @override
  Future<String> createItem({
    required String userId,
    required Item item,
  }) async {
    try {
      final snapshot = await firebaseFirestore
          .collection('list')
          .doc(userId)
          .collection('userList')
          .add(item.toDocument());
      return snapshot.id;
    } on FirebaseException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }

  @override
  Future<void> updateItem({
    required String userId,
    required Item item,
  }) async {
    try {
      await firebaseFirestore
          .collection('list')
          .doc(userId)
          .collection('userList')
          .doc(item.id)
          .update(item.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }

  @override
  Future<void> deleteItem({
    required String userId,
    required String itemId,
  }) async {
    try {
      await firebaseFirestore
          .collection('list')
          .doc(userId)
          .collection('userList')
          .doc(itemId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(
        msg: e.message,
      );
    }
  }
}
