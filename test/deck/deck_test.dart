import 'package:cards_buddy/deck/deck.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When standard deck is created then there should be 54 cards', () {
    final deck = DeckFactory.createStandardDeck();

    expect(deck.getCards().length, 54);
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
}

void assertHasCardsInSuite(Deck deck, Suite suite, num cardCount) {
  final hearts = deck.getCards().where((c) {
    return c.getSuite() == suite;
  });
  expect(hearts.length, cardCount);
}
