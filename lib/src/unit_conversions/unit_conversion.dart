import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit_conversions/best_fit_unit_conversion.dart';
import 'package:human_file_size/src/unit_conversions/specific_unit_conversion.dart';
import 'package:human_file_size/src/unit.dart';

/// Defines which unit the file size should be converted into before displaying.
abstract class UnitConversion {
  /// Returns an instance of [UnitConversion].
  const UnitConversion();

  /// Given a size in [bits], returns a [Unit] to represent it
  Unit bitsToUnit({required BigInt bits});

  /// {@macro BestFitUnitConversion}
  const factory UnitConversion.bestFit({required NumeralSystem numeralSystem}) =
      BestFitUnitConversion;

  /// {@macro SpecificUnitConversion}
  const factory UnitConversion.specific({required Unit unit}) =
      SpecificUnitConversion;
}
