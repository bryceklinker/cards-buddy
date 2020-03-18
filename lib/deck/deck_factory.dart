import 'package:cards_buddy/deck/card.dart';
import 'package:cards_buddy/deck/deck.dart';
import 'package:cards_buddy/deck/suite.dart';

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