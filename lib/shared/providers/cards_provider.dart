import 'package:flutter/material.dart';
import '../models/digital_card_model.dart';
import '../services/firestore_service.dart';

class CardsProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  
  List<DigitalCardModel> _cards = [];
  bool _isLoading = false;
  String? _error;

  List<DigitalCardModel> get cards => _cards;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUserCards(String userId) async {
    _setLoading(true);
    _clearError();
    
    try {
      _cards = await _firestoreService.getUserCards(userId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> saveCard(DigitalCardModel card) async {
    _setLoading(true);
    _clearError();
    
    try {
      await _firestoreService.saveDigitalCard(card);
      
      final existingIndex = _cards.indexWhere((c) => c.id == card.id);
      if (existingIndex >= 0) {
        _cards[existingIndex] = card;
      } else {
        _cards.insert(0, card);
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteCard(String cardId) async {
    _setLoading(true);
    _clearError();
    
    try {
      await _firestoreService.deleteDigitalCard(cardId);
      _cards.removeWhere((card) => card.id == cardId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
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
