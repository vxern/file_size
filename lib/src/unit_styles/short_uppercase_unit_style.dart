import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/short_lowercase_unit_style.dart';
import 'package:human_file_size/src/unit_styles/unit_style.dart';

/// {@template ShortUppercaseUnitStyle}
/// The unit will be displayed concisely with the prefix in uppercase.
///
/// For example, a kilobit will be shown as `Kb` and a kilobyte will be shown
/// as `KB`.
///
/// Note: Bits will be shown as `b` and bytes will be shown as `B` indifferent
/// of whether [ShortLowercaseUnitStyle] or [ShortUppercaseUnitStyle] are used.
/// {@endtemplate}
class ShortUppercaseUnitStyle extends UnitStyle {
  /// Returns an instance of [ShortUppercaseUnitStyle].
  const ShortUppercaseUnitStyle();

  @override
  String format(Unit unit) =>
      unit.symbols.shortUppercase ?? unit.symbols.shortLowercase;
}

/// Alias of [ShortUppercaseUnitStyle].
@Deprecated('Use [ShortUppercaseUnitStyle] instead.')
typedef ShortUppercaseStyle = ShortUppercaseUnitStyle;
