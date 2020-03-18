import 'dart:math';

import 'package:cards_buddy/deck/suite.dart';

import 'card.dart';

class Deck {
  final Random _randomizer = Random.secure();
  final List<Card> _cards;

  Deck(List<Card> cards)
      : _cards = cards;

  List<Card> get cards => _cards;

  get numberOfCards => cards.length;

  Deck shuffle() {
    final shuffledCards = [...cards];
    for(var i = 0; i < numberOfCards; i++) {
      final index = _randomizer.nextInt(numberOfCards);
      shuffledCards[i] = cards[index];
    }
    return Deck(shuffledCards);
  }

  Deck removeJokers() {
    final filteredCards = cards.where((c) => c.suite != Suite.Joker);
    return Deck(filteredCards.toList());
  }
}
