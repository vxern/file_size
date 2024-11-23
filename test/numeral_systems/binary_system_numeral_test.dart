import 'package:human_file_size/src/numeral_systems/binary_numeral_system.dart';

import 'numeral_system.dart';

void main() {
  testNumeralSystem(const BinaryNumeralSystem(), expectedUnitFactor: 1024);
}
