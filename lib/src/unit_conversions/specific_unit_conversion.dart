import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_conversions/unit_conversion.dart';

/// The size is converted to a specific unit, regardless of the magnitude of the
/// data.
///
/// For example, using [Unit.byte], given a file 3 MB large, the file size will
/// be given as 3,000,000 bytes.
class SpecificUnitConversion extends UnitConversion {
  /// The unit to convert the size to.
  final Unit unit;

  /// Returns an instance of [SpecificUnitConversion].
  const SpecificUnitConversion({required this.unit});

  @override
  Unit bitsToUnit({required BigInt bits}) => unit;
}
