import 'package:file_size/src/unit.dart';

sealed class DisplayMode {
  const DisplayMode._();

  static const bestFit = BestFit._();

  const factory DisplayMode.custom({required Unit unit}) = Custom._;
}

class BestFit extends DisplayMode {
  const BestFit._() : super._();
}

class Custom extends DisplayMode {
  final Unit unit;

  const Custom._({required this.unit}) : super._();
}
