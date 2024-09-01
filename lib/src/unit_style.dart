import 'package:file_size/src/unit.dart';

/// Represents the display style of a unit.
abstract class UnitStyle {
  /// Returns an instance of [UnitStyle].
  const UnitStyle();

  /// Given a [unit], formats it as a human-readable string in this style.
  String format(Unit unit);
}

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

/// The unit will be displayed in its long form with the prefix in lowercase.
///
/// For example, a kilobit will be shown as `kbit` and a kilobyte will be
/// shown as `kbyte`.
class LongLowercaseStyle extends UnitStyle {
  /// Returns an instance of [LongLowercaseStyle].
  const LongLowercaseStyle();

  @override
  String format(Unit unit) =>
      unit.symbols.longLowercase ?? unit.symbols.shortLowercase;
}

/// The unit will be displayed in its long form with the prefix in lowercase.
///
/// For example, a kilobit will be shown as `Kbit` and a kilobyte will be
/// shown as `Kbyte`.
class LongUppercaseStyle extends UnitStyle {
  /// Returns an instance of [LongUppercaseStyle].
  const LongUppercaseStyle();

  @override
  String format(Unit unit) =>
      unit.symbols.longUppercase ?? unit.symbols.shortLowercase;
}
