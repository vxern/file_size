import 'package:human_file_size/human_file_size.dart';

void main() {
  // 1000 bytes -> 1 kilobyte
  humanFileSize(1000); // 1 KB

  // 1 kilobit in bits
  humanFileSize(1000, inputUnit: Unit.bit); // 1 Kb

  // 1 megabit in kilobits
  humanFileSize(1000, inputUnit: Unit.kilobit); // 1 Mb
}
