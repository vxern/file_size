import 'package:human_file_size/human_file_size.dart';
import 'package:intl/intl.dart';

void main() {
  // `SimpleQuantityDisplayMode` is the default mode.
  humanFileSize(1); // 1 B

  // `IntlQuantityDisplayMode` can be used for localisation.
  humanFileSize(
    1.234,
    quantityDisplayMode: IntlQuantityDisplayMode(
      numberFormat: NumberFormat.decimalPattern('pl'),
    ),
  ); // 1,234 B
}
