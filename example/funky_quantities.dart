import 'package:file_size/file_size.dart';

void main() {
  // Negative sizes
  fileSizeToString(1000 * -2); // -2 KB

  // Infinity
  fileSizeToString(double.infinity); // ∞ B

  // Negative infinity
  fileSizeToString(double.negativeInfinity, inputUnit: Unit.kilobit); // -∞ Kb

  // NaN
  fileSizeToString(double.nan); // NaN B
}
