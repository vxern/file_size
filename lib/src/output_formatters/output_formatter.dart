/// Defines how to format the output.
abstract class OutputFormatter {
  /// Returns an instance of [OutputFormatter].
  const OutputFormatter();

  /// Given a [quantity] and a [unit], formats them as a human-readable string.
  String format({required String quantity, required String unit});
}
