import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/short_lowercase_style.dart';
import 'package:human_file_size/src/unit_styles/unit_style.dart';

/// The unit will be displayed concisely with the prefix in uppercase.
///
/// For example, a kilobit will be shown as `Kb` and a kilobyte will be shown
/// as `KB`.
///
/// Note: Bits will be shown as `b` and bytes will be shown as `B` indifferent
/// of whether [ShortLowercaseStyle] or [ShortUppercaseStyle] are used.
class ShortUppercaseStyle extends UnitStyle {
  /// Returns an instance of [ShortUppercaseStyle].
  const ShortUppercaseStyle();

  @override
  String format(Unit unit) =>
      unit.symbols.shortUppercase ?? unit.symbols.shortLowercase;
}
