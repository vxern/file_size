import 'package:human_file_size/human_file_size.dart';

void main() {
  humanFileSize(1); // 1 B

  humanFileSize(
    1,
    outputFormatter: const OutputFormatter.simple(includeSpace: false),
  ); // 1B

  humanFileSize(
    1,
    outputFormatter: const OutputFormatter.simple(unitFirst: true),
  ); // B 1

  humanFileSize(1, outputFormatter: const UnitOnlyOutputFormatter()); // B
}

final class UnitOnlyOutputFormatter extends OutputFormatter {
  const UnitOnlyOutputFormatter();

  @override
  String format({required String quantity, required String unit}) => unit;
}
