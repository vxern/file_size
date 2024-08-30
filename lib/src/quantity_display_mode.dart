import 'package:file_size/src/unit.dart';

sealed class QuantityDisplayMode {
  const QuantityDisplayMode();
}

final class FixedPrecisionDisplayMode extends QuantityDisplayMode {
  final int precision;

  const FixedPrecisionDisplayMode({this.precision = 2});
}

final class PrecisionDisplayMode extends QuantityDisplayMode {
  final int precision;

  const PrecisionDisplayMode({this.precision = 2});
}

final class TruncateDisplayMode extends QuantityDisplayMode {
  const TruncateDisplayMode();
}

final class RoundDisplayMode extends QuantityDisplayMode {
  const RoundDisplayMode();
}

final class CustomQuantityDisplayMode extends QuantityDisplayMode {
  final String Function(num quantity, {required Unit unit}) converter;

  const CustomQuantityDisplayMode({required this.converter});
}
