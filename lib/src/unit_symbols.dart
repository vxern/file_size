/// Stores the symbols used to represent a given unit.
class UnitSymbols {
  /// The short, lowercase variant of the symbol for this unit.
  final String shortLowercase;

  /// The short, uppercase variant of the symbol for this unit.
  final String? shortUppercase;

  /// The long, lowercase variant of the symbol for this unit.
  final String? longLowercase;

  /// The long, uppercase variant of the symbol for this unit.
  final String? longUppercase;

  /// Returns an instance of [UnitSymbols].
  const UnitSymbols({
    required this.shortLowercase,
    this.shortUppercase,
    this.longLowercase,
    this.longUppercase,
  });
}
