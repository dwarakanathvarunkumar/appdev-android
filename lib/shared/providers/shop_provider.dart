import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/firestore_service.dart';

class ShopProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _error;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUserProducts(String userId) async {
    _setLoading(true);
    _clearError();
    
    try {
      _products = await _firestoreService.getUserProducts(userId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> saveProduct(ProductModel product) async {
    _setLoading(true);
    _clearError();
    
    try {
      await _firestoreService.saveProduct(product);
      
      final existingIndex = _products.indexWhere((p) => p.id == product.id);
      if (existingIndex >= 0) {
        _products[existingIndex] = product;
      } else {
        _products.insert(0, product);
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteProduct(String productId) async {
    _setLoading(true);
    _clearError();
    
    try {
      await _firestoreService.deleteProduct(productId);
      _products.removeWhere((product) => product.id == productId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  String generateWhatsAppMessage() {
    if (_products.isEmpty) return '';
    
    final buffer = StringBuffer();
    buffer.writeln('🛍️ *My Product Catalog*\n');
    
    for (int i = 0; i < _products.length; i++) {
      final product = _products[i];
      buffer.writeln('${i + 1}. *${product.name}*');
      buffer.writeln('   Price: ${product.formattedPrice}');
      if (product.description?.isNotEmpty == true) {
        buffer.writeln('   ${product.description}');
      }
      buffer.writeln('');
    }
    
    buffer.writeln('💬 Reply with the product number to place an order!');
    buffer.writeln('\n📱 Powered by SellerCart');
    
    return buffer.toString();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  void clearError() {
    _clearError();
  }
}
