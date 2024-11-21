import 'package:human_file_size/human_file_size.dart';

void main() {
  // 1024 bytes -> 1 kibibyte
  humanFileSize(
    1024,
    unitConversion: const BestFitUnitConversion(
      numeralSystem: BinaryNumeralSystem(),
    ),
  ); // 1 KiB
}
