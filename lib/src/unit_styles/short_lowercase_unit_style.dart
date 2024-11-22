import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/short_uppercase_unit_style.dart';
import 'package:human_file_size/src/unit_styles/unit_style.dart';

/// {@template ShortLowercaseUnitStyle}
/// The unit will be displayed concisely with the prefix in lowercase.
///
/// For example, a kilobit will be shown as `kb` and a kilobyte will be shown
/// as `kB`.
///
/// Note: Bits will be shown as `b` and bytes will be shown as `B` indifferent
/// of whether [ShortLowercaseUnitStyle] or [ShortUppercaseUnitStyle] are used.
/// {@endtemplate}
class ShortLowercaseUnitStyle extends UnitStyle {
  /// Returns an instance of [ShortLowercaseUnitStyle].
  const ShortLowercaseUnitStyle();

  @override
  String format(Unit unit) => unit.symbols.shortLowercase;
}

/// Alias of [ShortLowercaseUnitStyle].
@Deprecated('Use [ShortLowercaseUnitStyle] instead.')
typedef ShortLowercaseStyle = ShortLowercaseUnitStyle;
