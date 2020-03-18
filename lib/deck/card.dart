import 'package:cards_buddy/deck/suite.dart';

class Card {
  final Suite _suite;
  final num _value;

  Card(Suite suite, num value)
      : _suite = suite,
        _value = value;

  Suite get suite => _suite;
  num get value => _value;

  bool operator ==(o) {
    return o is Card && o.value == value && o.suite == suite;
  }

  int get hashCode {
    int result = 17;
    result = 37 * result + suite.hashCode;
    result = 37 * result + value.hashCode;
    return result;
  }
}
