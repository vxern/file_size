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
  /// Returns an instance of [SimpleOutputFormatter].
  const SimpleOutputFormatter();

  @override
  String format({required String quantity, required String unit}) =>
      '$quantity $unit';
}
