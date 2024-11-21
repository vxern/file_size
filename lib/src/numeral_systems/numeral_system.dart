import 'package:human_file_size/src/unit.dart';

/// Represents the numeral system of units.
abstract class NumeralSystem {
  /// A list of units in this numeral system, arranged in ascending order.
  List<Unit> get units;

  /// Returns an instance of [NumeralSystem].
  const NumeralSystem();
}
