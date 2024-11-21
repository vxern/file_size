import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/short_uppercase_style.dart';
import 'package:human_file_size/src/unit_styles/unit_style.dart';

/// The unit will be displayed concisely with the prefix in lowercase.
///
/// For example, a kilobit will be shown as `kb` and a kilobyte will be shown
/// as `kB`.
///
/// Note: Bits will be shown as `b` and bytes will be shown as `B` indifferent
/// of whether [ShortLowercaseStyle] or [ShortUppercaseStyle] are used.
class ShortLowercaseStyle extends UnitStyle {
  /// Returns an instance of [ShortLowercaseStyle].
  const ShortLowercaseStyle();

  @override
  String format(Unit unit) => unit.symbols.shortLowercase;
}
