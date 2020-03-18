import 'package:cards_buddy/deck/deck.dart';
import 'package:cards_buddy/deck/deck_factory.dart';

class CribbageGame {
  final Deck _deck;

  Deck get deck => _deck;

  CribbageGame() : _deck = DeckFactory.createStandardDeck().removeJokers();
}
