import 'package:human_file_size/human_file_size.dart';

void main() {
  fileSizeToString(1, inputUnit: Unit.gigabit); // Gb

  fileSizeToString(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const ShortLowercaseStyle(),
  ); // gb

  fileSizeToString(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const LongLowercaseStyle(),
  ); // gbit

  fileSizeToString(
    1,
    inputUnit: Unit.gigabit,
    unitStyle: const LongUppercaseStyle(),
  ); // Gbit
}
