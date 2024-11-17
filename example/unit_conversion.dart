import 'package:file_size/file_size.dart';

void main() {
  // 1000 bytes -> 1 kilobyte
  fileSizeToString(1000); // 1 Kb

  // 1000 bytes -> 8000 bits
  fileSizeToString(
    1000,
    unitConversion: SpecificUnitConversion(unit: Unit.bit),
  ); // 8000 b
}
