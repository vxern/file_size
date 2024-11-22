import 'package:human_file_size/human_file_size.dart';

void main() {
  // 1000 bytes -> 1 kilobyte
  humanFileSize(1000); // 1 Kb

  // 1000 bytes -> 8000 bits
  humanFileSize(
    1000,
    unitConversion: UnitConversion.specific(unit: Unit.bit),
  ); // 8000 b
}
