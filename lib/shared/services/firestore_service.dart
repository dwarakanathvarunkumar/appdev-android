import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/digital_card_model.dart';
import '../models/product_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDigitalCard(DigitalCardModel card) async {
    try {
      await _firestore.collection('digital_cards').doc(card.id).set(card.toJson());
    } catch (e) {
      throw Exception('Failed to save digital card: $e');
    }
  }

  Future<List<DigitalCardModel>> getUserCards(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('digital_cards')
          .where('userId', isEqualTo: userId)
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => DigitalCardModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get user cards: $e');
    }
  }

  Future<void> deleteDigitalCard(String cardId) async {
    try {
      await _firestore.collection('digital_cards').doc(cardId).delete();
    } catch (e) {
      throw Exception('Failed to delete digital card: $e');
    }
  }

  Future<void> saveProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').doc(product.id).set(product.toJson());
    } catch (e) {
      throw Exception('Failed to save product: $e');
    }
  }

  Future<List<ProductModel>> getUserProducts(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('products')
          .where('userId', isEqualTo: userId)
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get user products: $e');
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  Stream<List<DigitalCardModel>> getUserCardsStream(String userId) {
    return _firestore
        .collection('digital_cards')
        .where('userId', isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => DigitalCardModel.fromJson(doc.data()))
            .toList());
  }

  Stream<List<ProductModel>> getUserProductsStream(String userId) {
    return _firestore
        .collection('products')
        .where('userId', isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());
  }
}
