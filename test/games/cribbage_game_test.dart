import 'package:cards_buddy/games/game_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When cribbage game is created then deck does not have jokers', () {
    final game = GameFactory.createCribbageGame();

    expect(game.deck.numberOfCards, 52);
  });
}