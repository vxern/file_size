import 'package:file_size/file_size.dart';
import 'package:file_size/src/numeral_system.dart';
import 'package:file_size/src/unit.dart';

/// Defines which unit the file size should be converted into before displaying.
abstract class UnitConversion {
  const UnitConversion._();

  /// Given a size in [bits], returns a [Unit] to represent it
  Unit bitsToUnit({required BigInt bits});
}

/// The size is converted to the largest possible unit that most accurately
/// describes its magnitude, subject to the [NumeralSystem] used.
///
/// For example, using this conversion with the [DecimalSystem], given a file
/// 500 gigabytes large, the conversion will give the file size in gigabytes. On
/// the other hand, given a file 1000 gigabytes large, the conversion will give
/// the file size in terabytes.
///
/// Similarly, using this conversion with the [BinarySystem], given a file 512
/// gibibytes large, the conversion will give the file size in gibibytes. On the
/// other hand, given a file 1024 gibibytes large, the conversion will give the
/// file size in tebibytes.
class BestFitConversion extends UnitConversion {
  /// The numeral system of the candidate units for conversion.
  final NumeralSystem numeralSystem;

  /// Returns an instance of [BestFitConversion].
  ///
  /// By default, [BestFitConversion] uses the decimal numeral system, returning
  /// units KB, MB, GB, etc.
  const BestFitConversion({
    this.numeralSystem = const DecimalSystem(),
  }) : super._();

  @override
  Unit bitsToUnit({required BigInt bits}) {
    for (final unit in numeralSystem.units.reversed) {
      if (bits >= unit.bits) {
        return unit;
      }
    }

    return Unit.bit;
  }
}

/// The size is converted to a specific unit, regardless of the magnitude of the
/// data.
///
/// For example, using [Unit.byte], given a file 3 MB large, the file size will
/// be given as 3,000,000 bytes.
class CustomUnitConversion extends UnitConversion {
  /// The unit to convert the size to.
  final Unit unit;

  /// Returns an instance of [CustomUnitConversion].
  const CustomUnitConversion({required this.unit}) : super._();

  @override
  Unit bitsToUnit({required BigInt bits}) => unit;
}
