import 'package:human_file_size/human_file_size.dart';

void main() {
  // 0 bytes, shown in bits
  humanFileSize(0); // 0 b

  // Less than one byte
  humanFileSize(0.75); // 6 b

  // 8 bytes
  humanFileSize(8); // 8 B

  // 1.2 kilobytes in bytes
  humanFileSize(1000 * 1.2); // 1.2 KB

  // 3 gigabytes in bytes
  humanFileSize(1000 * 1000 * 1000 * 3); // 3 GB
}
