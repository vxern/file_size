import 'package:file_size/src/unit.dart';

/// Represents the display style of the unit.
enum UnitStyle {
  /// The unit will be displayed concisely with the prefix in lowercase.
  ///
  /// For example, a kilobit will be shown as `kb` and a kilobyte will be shown
  /// as `kB`.
  ///
  /// Note: Bits will be shown as `b` and bytes will be shown as `B` indifferent
  /// of whether [shortLowercase] or [shortUppercase] is used.
  shortLowercase,

  /// The unit will be displayed concisely with the prefix in uppercase.
  ///
  /// For example, a kilobit will be shown as `Kb` and a kilobyte will be shown
  /// as `KB`.
  ///
  /// Note: Bits will be shown as `b` and bytes will be shown as `B` indifferent
  /// of whether [shortLowercase] or [shortUppercase] is used.
  shortUppercase,

  /// The unit will be displayed in its long form with the prefix in lowercase.
  ///
  /// For example, a kilobit will be shown as `kbit` and a kilobyte will be
  /// shown as `kbyte`.
  longLowercase,

  /// The unit will be displayed in its long form with the prefix in lowercase.
  ///
  /// For example, a kilobit will be shown as `Kbit` and a kilobyte will be
  /// shown as `Kbyte`.
  longUppercase;

  /// Given a [unit], formats it as a human-readable string using the current
  /// style.
  String format(Unit unit) => switch (this) {
        UnitStyle.shortLowercase => unit.symbols.shortLowercase,
        UnitStyle.shortUppercase => unit.symbols.shortUppercase,
        UnitStyle.longLowercase => unit.symbols.longLowercase,
        UnitStyle.longUppercase => unit.symbols.longUppercase,
      };
}
