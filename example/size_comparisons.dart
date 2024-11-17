// ignore_for_file: unnecessary_statements

import 'package:human_file_size/human_file_size.dart';

void main() {
  final byteCount = BigInt.from(50);

  byteCount >= Unit.kilobit.bytes; // false

  byteCount >= Unit.bit.bytes; // true
}
