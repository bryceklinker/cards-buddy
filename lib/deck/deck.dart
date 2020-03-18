class Deck {
  final List<Card> _cards;

  Deck(List<Card> cards)
      : _cards = cards;

  List<Card> getCards() {
    return _cards;
  }

}

class DeckFactory {
  static Deck createStandardDeck() {
    final cards = [
      ...createCardsInSuite(Suite.Hearts),
      ...createCardsInSuite(Suite.Clubs),
      ...createCardsInSuite(Suite.Spades),
      ...createCardsInSuite(Suite.Diamonds),
      ...createJokers()
    ];
    return Deck(cards);
  }

  static List<Card> createCardsInSuite(Suite suite) {
    final cards = new List<Card>();
    for(var i = 0; i < 13; i++) {
      cards.add(Card(suite, i + 1));
    }
    return cards;
  }

  static List<Card> createJokers() {
    return List<Card>.from([
      Card(Suite.Joker, 0),
      Card(Suite.Joker, 1)
    ]);
  }
}

class Card {
  final Suite _suite;
  final num _value;

  Card(Suite suite, num value)
    : _suite = suite,
      _value = value;

  Suite getSuite() { return _suite; }
}

enum Suite {
  Hearts,
  Clubs,
  Spades,
  Diamonds,
  Joker
}
