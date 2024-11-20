import 'package:human_file_size/human_file_size.dart';

void main() {
  humanFileSize(1); // 1 B

  humanFileSize(
    1,
    outputFormatter: const SimpleOutputFormatter(includeSpace: false),
  ); // 1B

  humanFileSize(
    1,
    outputFormatter: const SimpleOutputFormatter(unitFirst: true),
  ); // B 1

  humanFileSize(1, outputFormatter: const UnitOnlyOutputFormatter()); // B
}

final class UnitOnlyOutputFormatter extends OutputFormatter {
  const UnitOnlyOutputFormatter();

  @override
  String format({required String quantity, required String unit}) => unit;
}
