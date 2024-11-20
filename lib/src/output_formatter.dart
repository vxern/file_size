/// The default number format is [SimpleOutputFormatter].
const defaultOutputFormatter = SimpleOutputFormatter();

/// Defines how to format the output.
abstract class OutputFormatter {
  /// Returns an instance of [OutputFormatter].
  const OutputFormatter();

  /// Given a [quantity] and a [unit], formats them as a human-readable string.
  String format({required String quantity, required String unit});
}

/// The quantity and unit are formatted as '${quantity} ${unit}'.
class SimpleOutputFormatter extends OutputFormatter {
  /// If enabled, there will be a space in-between the quantity and unit.
  final bool includeSpace;

  /// If enabled, the unit will come before the quantity.
  final bool unitFirst;

  /// Returns an instance of [SimpleOutputFormatter].
  const SimpleOutputFormatter({
    this.includeSpace = true,
    this.unitFirst = false,
  });

  @override
  String format({required String quantity, required String unit}) {
    final (first, second) = unitFirst ? (unit, quantity) : (quantity, unit);

    return [first, if (includeSpace) '', second].join();
  }
}
