import 'package:cards_buddy/deck/deck.dart';
import 'package:cards_buddy/deck/deck_factory.dart';
import 'package:cards_buddy/deck/suite.dart';
import 'package:flutter_test/flutter_test.dart';

const MAX_ACCEPTABLE_MATCHING_IN_SHUFFLED_DECK = 5;

void main() {
  test('When standard deck is created then there should be 54 cards', () {
    final deck = DeckFactory.createStandardDeck();

    expect(deck.cards.length, 54);
  });

  test('When standard deck is created then 13 of each suite', () {
    final deck = DeckFactory.createStandardDeck();

    assertHasCardsInSuite(deck, Suite.Hearts, 13);
    assertHasCardsInSuite(deck, Suite.Diamonds, 13);
    assertHasCardsInSuite(deck, Suite.Spades, 13);
    assertHasCardsInSuite(deck, Suite.Clubs, 13);
  });

  test('When standard deck is created then 2 jokers available', () {
    final deck = DeckFactory.createStandardDeck();

    assertHasCardsInSuite(deck, Suite.Joker, 2);
  });

  test('When shuffled then cards are in random order', () {
    final deck = DeckFactory.createStandardDeck();

    final shuffledDeck = deck.shuffle();

    assertCardsAreNotInTheSameOrder(shuffledDeck, deck);
  });

  test('When jokers are removed from deck then 52 cards are left', () {
    final deck = DeckFactory.createStandardDeck();

    final jokerlessDeck = deck.removeJokers();

    expect(jokerlessDeck.cards.length, 52);
  });
}

void assertHasCardsInSuite(Deck deck, Suite suite, num cardCount) {
  final hearts = deck.cards.where((c) => c.suite == suite);
  expect(hearts.length, cardCount);
}

void assertCardsAreNotInTheSameOrder(Deck shuffled, Deck original) {
  expect(shuffled.cards.length, original.cards.length);

  var matchingCards = 0;
  for(var i = 0; i < original.cards.length; i++) {
    if (shuffled.cards[i] == original.cards[i]) {
      matchingCards++;
    }
  }

  expect(matchingCards,
      lessThanOrEqualTo(MAX_ACCEPTABLE_MATCHING_IN_SHUFFLED_DECK)
  );
}
