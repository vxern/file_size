import 'package:human_file_size/src/unit.dart';

/// Represents the display style of a unit.
abstract class UnitStyle {
  /// Returns an instance of [UnitStyle].
  const UnitStyle();

  /// Given a [unit], formats it as a human-readable string in this style.
  String format(Unit unit);
}
