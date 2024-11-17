import 'package:file_size/file_size.dart';

void main() {
  // 0 bytes, shown in bits
  fileSizeToString(0); // 0 b

  // Less than one byte
  fileSizeToString(0.75); // 6 b

  // 8 bytes
  fileSizeToString(8); // 8 B

  // 1.2 kilobytes in bytes
  fileSizeToString(1000 * 1.2); // 1.2 KB

  // 3 gigabytes in bytes
  fileSizeToString(1000 * 1000 * 1000 * 3); // 3 GB
}
