import 'package:file_size/src/display_mode.dart';
import 'package:file_size/src/unit.dart';

String fileSize(
  num quantity, {
  Unit inputUnit = Unit.byte,
  DisplayMode displayMode = DisplayMode.bestFit,
}) {
  final inputBits = inputUnit.quantityToBits(quantity);

  final outputUnit = switch (displayMode) {
    BestFit() => Unit.matchToSize(bits: inputBits),
    Custom(unit: final unit) => unit,
  };
  final outputQuantity = outputUnit.bitsToQuantity(inputBits);

  return '$outputQuantity ${outputUnit.symbol}';
}
