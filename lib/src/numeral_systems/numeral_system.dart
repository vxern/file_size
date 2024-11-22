import 'package:human_file_size/human_file_size.dart';

/// Represents the numeral system of units.
abstract class NumeralSystem {
  /// A list of units in this numeral system, arranged in ascending order.
  List<Unit> get units;

  /// Returns an instance of [NumeralSystem].
  const NumeralSystem();

  /// {@macro BinaryNumeralSystem}
  const factory NumeralSystem.binary() = BinaryNumeralSystem;

  /// {@macro DecimalNumeralSystem}
  const factory NumeralSystem.decimal() = DecimalNumeralSystem;
}
