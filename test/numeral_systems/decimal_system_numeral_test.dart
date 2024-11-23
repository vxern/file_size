import 'package:human_file_size/src/numeral_systems/decimal_numeral_system.dart';

import 'numeral_system.dart';

void main() {
  testNumeralSystem(const DecimalNumeralSystem(), expectedUnitFactor: 1000);
}
