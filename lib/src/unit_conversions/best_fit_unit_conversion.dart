import 'package:human_file_size/src/numeral_systems/binary_numeral_system.dart';
import 'package:human_file_size/src/numeral_systems/decimal_numeral_system.dart';
import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_conversions/unit_conversion.dart';

/// The size is converted to the largest possible unit that most accurately
/// describes its magnitude, subject to the [NumeralSystem] used. The conversion
/// works identically for negative values.
///
/// For example, using this conversion with the [DecimalNumeralSystem], given a
/// file 500 gigabytes large, the conversion will give the file size in
/// gigabytes. On the other hand, given a file 1000 gigabytes large, the
/// conversion will give the file size in terabytes.
///
/// Similarly, using this conversion with the [BinaryNumeralSystem], given a
/// file 512 gibibytes large, the conversion will give the file size in
/// gibibytes. On the other hand, given a file 1024 gibibytes large, the
/// conversion will give the file size in tebibytes.
class BestFitUnitConversion extends UnitConversion {
  /// The numeral system of the candidate units for conversion.
  final NumeralSystem numeralSystem;

  /// Returns an instance of [BestFitUnitConversion].
  ///
  /// By default, [BestFitUnitConversion] uses the decimal numeral system,
  /// returning units KB, MB, GB, etc.
  const BestFitUnitConversion({required this.numeralSystem});

  @override
  Unit bitsToUnit({required BigInt bits}) {
    for (final unit in numeralSystem.units.reversed) {
      if (bits.abs() >= unit.bits) {
        return unit;
      }
    }

    return Unit.bit;
  }
}

/// Alias of [BestFitUnitConversion].
@Deprecated('Use [BestFitUnitConversion] instead.')
typedef BestFitConversion = BestFitUnitConversion;
