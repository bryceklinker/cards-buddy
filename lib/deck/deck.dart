import 'dart:math';

import 'card.dart';

class Deck {
  final Random randomizer = Random.secure();
  final List<Card> _cards;

  Deck(List<Card> cards)
      : _cards = cards;

  List<Card> get cards => _cards;

  Deck shuffle() {
    final shuffledCards = [...cards];
    for(var i = 0; i < cards.length; i++) {
      final index = randomizer.nextInt(cards.length);
      shuffledCards[i] = cards[index];
    }
    return Deck(shuffledCards);
  }
}
