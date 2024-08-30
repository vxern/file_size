enum UnitStyle {
  shortLowercase,
  shortUppercase,
  longLowercase,
  longUppercase,
}

typedef UnitSymbols = ({
  String shortLowercase,
  String shortUppercase,
  String longLowercase,
  String longUppercase,
});

enum Unit {
  /// 1 bit
  bit(
    1,
    symbols: (
      shortLowercase: 'b',
      shortUppercase: 'b',
      longLowercase: 'bit',
      longUppercase: 'Bit',
    ),
  ),

  /// 8 bits
  byte(
    8,
    symbols: (
      shortLowercase: 'B',
      shortUppercase: 'B',
      longLowercase: 'byte',
      longUppercase: 'Byte',
    ),
  ),

  /// 10^3 bits ~~ 1000 bits
  kilobit(
    1000,
    symbols: (
      shortLowercase: 'kb',
      shortUppercase: 'Kb',
      longLowercase: 'kbit',
      longUppercase: 'Kbit',
    ),
  ),

  /// 10^3 bytes ~~ 1000 bytes
  kilobyte(
    1000 * 8,
    symbols: (
      shortLowercase: 'kB',
      shortUppercase: 'KB',
      longLowercase: 'kbyte',
      longUppercase: 'Kbyte',
    ),
  ),

  /// 10^6 bits ~~ 1000^2 bits
  megabit(
    1000 * 1000,
    symbols: (
      shortLowercase: 'mb',
      shortUppercase: 'Mb',
      longLowercase: 'mbit',
      longUppercase: 'Mbit',
    ),
  ),

  /// 10^6 bytes ~~ 1000^2 bytes
  megabyte(
    1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'mB',
      shortUppercase: 'MB',
      longLowercase: 'mbyte',
      longUppercase: 'Mbyte',
    ),
  ),

  /// 10^9 bits ~~ 1000^3 bits
  gigabit(
    1000 * 1000 * 1000,
    symbols: (
      shortLowercase: 'gb',
      shortUppercase: 'Gb',
      longLowercase: 'gbit',
      longUppercase: 'Gbit',
    ),
  ),

  /// 10^9 bytes ~~ 1000^3 bytes
  gigabyte(
    1000 * 1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'gB',
      shortUppercase: 'GB',
      longLowercase: 'gbyte',
      longUppercase: 'Gbyte',
    ),
  ),

  /// 10^12 bits ~~ 1000^4 bits
  terabit(
    1000 * 1000 * 1000 * 1000,
    symbols: (
      shortLowercase: 'tb',
      shortUppercase: 'Tb',
      longLowercase: 'tbit',
      longUppercase: 'Tbit',
    ),
  ),

  /// 10^12 bytes ~~ 1000^4 bytes
  terabyte(
    1000 * 1000 * 1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'tB',
      shortUppercase: 'TB',
      longLowercase: 'tbyte',
      longUppercase: 'Tbyte',
    ),
  ),

  /// 10^15 bits ~~ 1000^5 bits
  petabit(
    1000 * 1000 * 1000 * 1000 * 1000,
    symbols: (
      shortLowercase: 'pb',
      shortUppercase: 'Pb',
      longLowercase: 'pbit',
      longUppercase: 'Pbit',
    ),
  ),

  /// 10^15 bytes ~~ 1000^5 bytes
  petabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'pB',
      shortUppercase: 'PB',
      longLowercase: 'pbyte',
      longUppercase: 'Pbyte',
    ),
  ),

  /// 10^18 bits ~~ 1000^6 bits
  exabit(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000,
    symbols: (
      shortLowercase: 'eb',
      shortUppercase: 'Eb',
      longLowercase: 'ebit',
      longUppercase: 'Ebit',
    ),
  ),

  /// 10^18 bytes ~~ 1000^6 bytes
  exabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'eB',
      shortUppercase: 'EB',
      longLowercase: 'ebyte',
      longUppercase: 'Ebyte',
    ),
  ),

  /// 10^21 bits ~~ 1000^7 bits
  zettabit(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000,
    symbols: (
      shortLowercase: 'zb',
      shortUppercase: 'Zb',
      longLowercase: 'zbit',
      longUppercase: 'Zbit',
    ),
  ),

  /// 10^21 bytes ~~ 1000^7 bytes
  zettabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'zB',
      shortUppercase: 'ZB',
      longLowercase: 'zbyte',
      longUppercase: 'Zbyte',
    ),
  ),

  /// 10^24 bits ~~ 1000^8 bits
  yottabit(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000,
    symbols: (
      shortLowercase: 'yb',
      shortUppercase: 'Yb',
      longLowercase: 'ybit',
      longUppercase: 'Ybit',
    ),
  ),

  /// 10^24 bytes ~~ 1000^8 bytes
  yottabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbols: (
      shortLowercase: 'yB',
      shortUppercase: 'YB',
      longLowercase: 'ybyte',
      longUppercase: 'Ybyte',
    ),
  ),

  /// 2^10 bits ~~ 1024 bits
  kibibit(
    1 << 10,
    symbols: (
      shortLowercase: 'kib',
      shortUppercase: 'Kib',
      longLowercase: 'kibit',
      longUppercase: 'Kibit',
    ),
  ),

  /// 2^10 bytes ~~ 1024 bytes
  kibibyte(
    (1 << 10) << 3,
    symbols: (
      shortLowercase: 'kiB',
      shortUppercase: 'KiB',
      longLowercase: 'kibyte',
      longUppercase: 'Kibyte',
    ),
  ),

  /// 2^20 bits ~~ 1024^2 bits
  mebibit(
    1 << 20,
    symbols: (
      shortLowercase: 'mib',
      shortUppercase: 'Mib',
      longLowercase: 'mibit',
      longUppercase: 'Mibit',
    ),
  ),

  /// 2^20 bytes ~~ 1024^2 bytes
  mebibyte(
    (1 << 20) << 3,
    symbols: (
      shortLowercase: 'miB',
      shortUppercase: 'MiB',
      longLowercase: 'mibyte',
      longUppercase: 'Mibyte',
    ),
  ),

  /// 2^30 bits ~~ 1024^3 bits
  gibibit(
    1 << 30,
    symbols: (
      shortLowercase: 'gib',
      shortUppercase: 'Gib',
      longLowercase: 'gibit',
      longUppercase: 'Gibit',
    ),
  ),

  /// 2^30 bytes ~~ 1024^3 bytes
  gibibyte(
    (1 << 30) << 3,
    symbols: (
      shortLowercase: 'giB',
      shortUppercase: 'GiB',
      longLowercase: 'gibyte',
      longUppercase: 'Gibyte',
    ),
  ),

  /// 2^40 bits ~~ 1024^4 bits
  tebibit(
    1 << 40,
    symbols: (
      shortLowercase: 'tib',
      shortUppercase: 'Tib',
      longLowercase: 'tibit',
      longUppercase: 'Tibit',
    ),
  ),

  /// 2^40 bytes ~~ 1024^4 bytes
  tebibyte(
    (1 << 40) << 3,
    symbols: (
      shortLowercase: 'tiB',
      shortUppercase: 'TiB',
      longLowercase: 'tibyte',
      longUppercase: 'Tibyte',
    ),
  ),

  /// 2^50 bits ~~ 1024^5 bits
  pebibit(
    1 << 50,
    symbols: (
      shortLowercase: 'pib',
      shortUppercase: 'Pib',
      longLowercase: 'pibit',
      longUppercase: 'Pibit',
    ),
  ),

  /// 2^50 bytes ~~ 1024^5 bytes
  pebibyte(
    (1 << 50) << 3,
    symbols: (
      shortLowercase: 'piB',
      shortUppercase: 'PiB',
      longLowercase: 'pibyte',
      longUppercase: 'Pibyte',
    ),
  ),

  /// 2^60 bits ~~ 1024^6 bits
  exbibit(
    1 << 60,
    symbols: (
      shortLowercase: 'eib',
      shortUppercase: 'Eib',
      longLowercase: 'eibit',
      longUppercase: 'Eibit',
    ),
  ),

  /// 2^60 bytes ~~ 1024^6 bytes
  exbibyte(
    (1 << 60) << 3,
    symbols: (
      shortLowercase: 'eiB',
      shortUppercase: 'EiB',
      longLowercase: 'eibyte',
      longUppercase: 'Eibyte',
    ),
  ),

  /// 2^70 bits ~~ 1024^7 bits
  zebibit(
    1 << 70,
    symbols: (
      shortLowercase: 'zib',
      shortUppercase: 'Zib',
      longLowercase: 'zibit',
      longUppercase: 'Zibit',
    ),
  ),

  /// 2^70 bytes ~~ 1024^7 bytes
  zebibyte(
    (1 << 70) << 3,
    symbols: (
      shortLowercase: 'ziB',
      shortUppercase: 'ZiB',
      longLowercase: 'zibyte',
      longUppercase: 'Zibyte',
    ),
  ),

  /// 2^80 bits ~~ 1024^8 bits
  yobibit(
    1 << 80,
    symbols: (
      shortLowercase: 'yib',
      shortUppercase: 'Yib',
      longLowercase: 'yibit',
      longUppercase: 'Yibit',
    ),
  ),

  /// 2^80 bytes ~~ 1024^8 bytes
  yobibyte(
    (1 << 80) << 3,
    symbols: (
      shortLowercase: 'yiB',
      shortUppercase: 'YiB',
      longLowercase: 'yibyte',
      longUppercase: 'Yibyte',
    ),
  );

  final int bits;
  final UnitSymbols symbols;

  const Unit(this.bits, {required this.symbols});

  factory Unit.matchToSize({required int bits}) {
    for (final unit in Unit.values.reversed) {
      if (bits >= unit.bits) {
        return unit;
      }
    }

    return Unit.bit;
  }

  int quantityToBits(num quantity) => (quantity * bits).floor();

  num bitsToQuantity(int bits) => (bits / this.bits).floor();
}
