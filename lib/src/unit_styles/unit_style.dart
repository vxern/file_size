import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/long_lowercase_unit_style.dart';
import 'package:human_file_size/src/unit_styles/long_uppercase_unit_style.dart';
import 'package:human_file_size/src/unit_styles/short_lowercase_unit_style.dart';
import 'package:human_file_size/src/unit_styles/short_uppercase_unit_style.dart';

/// Represents the display style of a unit.
abstract class UnitStyle {
  /// Returns an instance of [UnitStyle].
  const UnitStyle();

  /// Given a [unit], formats it as a human-readable string in this style.
  String format(Unit unit);

  /// {@macro LongLowercaseUnitStyle}
  const factory UnitStyle.longLowercase() = LongLowercaseUnitStyle;

  /// {@macro LongUppercaseUnitStyle}
  const factory UnitStyle.longUppercase() = LongUppercaseUnitStyle;

  /// {@macro ShortLowercaseUnitStyle}
  const factory UnitStyle.shortLowercase() = ShortLowercaseUnitStyle;

  /// {@macro ShortUppercaseUnitStyle}
  const factory UnitStyle.shortUppercase() = ShortUppercaseUnitStyle;
}
