import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ThenIShouldSeeFiveCardsInMyHandStep extends ThenWithWorld<FlutterWorld> {
  final playerCardLocator = find.byValueKey('player-card');
  @override
  RegExp get pattern => RegExp(r'I should see five cards in my hand');

  @override
  Future<void> executeStep() async {
    final rendered = await world.driver.getRenderObjectDiagnostics(playerCardLocator);
    expectMatch(rendered.length, 5);
  }

}