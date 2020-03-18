import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class WhenIStartAFourHandedCribbageGameStep extends WhenWithWorld<FlutterWorld> {
  final startCribbageGameLocator = find.byValueKey('start-cribbage-game');
  final cutDeckSliderLocator = find.byValueKey('cut-deck-slider');
  final cutDeckConfirmLocator = find.byValueKey('cut-deck-confirm');

  @override
  RegExp get pattern => RegExp(r'I start a four handed cribbage game');

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, startCribbageGameLocator);
    await world.driver.scroll(cutDeckSliderLocator, 0, 23, Duration(milliseconds: 5));
    await FlutterDriverUtils.tap(world.driver, cutDeckConfirmLocator);
  }
}