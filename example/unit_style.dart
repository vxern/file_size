import 'package:human_file_size/human_file_size.dart';

void main() {
  humanFileSize(1, inputUnit: Unit.gigabit); // Gb

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const ShortLowercaseStyle(),
  ); // gb

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const LongLowercaseStyle(),
  ); // gbit

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const LongUppercaseStyle(),
  ); // Gbit
}
