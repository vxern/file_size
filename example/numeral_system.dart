import 'package:human_file_size/human_file_size.dart';

void main() {
  // 1024 bytes -> 1 kibibyte
  fileSizeToString(
    1024,
    unitConversion: const BestFitConversion(
      numeralSystem: BinarySystem(),
    ),
  ); // 1 KiB
}
