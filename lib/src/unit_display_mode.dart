import 'package:file_size/src/unit.dart';

sealed class UnitDisplayMode {
  const UnitDisplayMode._();
}

final class BestFitDisplayMode extends UnitDisplayMode {
  const BestFitDisplayMode() : super._();
}

final class CustomDisplayMode extends UnitDisplayMode {
  final Unit unit;

  const CustomDisplayMode({required this.unit}) : super._();
}
