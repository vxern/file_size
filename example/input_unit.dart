import 'package:file_size/file_size.dart';

void main() {
  // 1000 bytes -> 1 kilobyte
  fileSizeToString(1000); // 1 KB

  // 1 kilobit in bits
  fileSizeToString(1000, inputUnit: Unit.bit); // 1 Kb

  // 1 megabit in kilobits
  fileSizeToString(1000, inputUnit: Unit.kilobit); // 1 Mb
}
