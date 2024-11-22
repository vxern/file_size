import 'package:human_file_size/human_file_size.dart';

/// Defines how to format the output.
abstract class OutputFormatter {
  /// Returns an instance of [OutputFormatter].
  const OutputFormatter();

  /// Given a [quantity] and a [unit], formats them as a human-readable string.
  String format({required String quantity, required String unit});

  /// {@macro SimpleOutputFormatter}
  const factory OutputFormatter.simple({
    bool includeSpace,
    bool unitFirst,
  }) = SimpleOutputFormatter;
}
