import 'package:human_file_size/human_file_size.dart';

void main() {
  humanFileSize(1, inputUnit: Unit.gigabit); // Gb

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const UnitStyle.shortLowercase(),
  ); // gb

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const UnitStyle.longLowercase(),
  ); // gbit

  humanFileSize(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const UnitStyle.longUppercase(),
  ); // Gbit
}
