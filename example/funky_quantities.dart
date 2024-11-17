import 'package:human_file_size/human_file_size.dart';

void main() {
  // Negative sizes
  humanFileSize(1000 * -2); // -2 KB

  // Infinity
  humanFileSize(double.infinity); // ∞ B

  // Negative infinity
  humanFileSize(double.negativeInfinity, inputUnit: Unit.kilobit); // -∞ Kb

  // NaN
  humanFileSize(double.nan); // NaN B
}
