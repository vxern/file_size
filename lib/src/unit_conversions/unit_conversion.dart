import 'package:human_file_size/src/unit.dart';

/// Defines which unit the file size should be converted into before displaying.
abstract class UnitConversion {
  /// Returns an instance of [UnitConversion].
  const UnitConversion();

  /// Given a size in [bits], returns a [Unit] to represent it
  Unit bitsToUnit({required BigInt bits});
}
