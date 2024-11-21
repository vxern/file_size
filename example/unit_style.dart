import 'package:human_file_size/human_file_size.dart';

void main() {
  humanFileSize(1, inputUnit: Unit.gigabit); // Gb

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const ShortLowercaseUnitStyle(),
  ); // gb

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const LongLowercaseUnitStyle(),
  ); // gbit

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const LongUppercaseUnitStyle(),
  ); // Gbit
}
