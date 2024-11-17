import 'package:human_file_size/human_file_size.dart';

void main() {
  fileSizeToString(1); // 1 B

  fileSizeToString(1.25); // 1.25 B

  // If you were feeling extra Roman today, you could do:
  fileSizeToString(
    1,
    quantityDisplayMode: CustomQuantityDisplayMode(
      converter: (quantity, {required unit}) => 'XIX',
    ),
  ); // XIX B
}
