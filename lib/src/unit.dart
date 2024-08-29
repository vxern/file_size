enum Unit {
  /// 1 bit
  bit(
    1,
    symbol: 'b',
  ),

  /// 8 bits
  byte(
    8,
    symbol: 'B',
  ),

  /// 10^3 bits ~~ 1000 bits
  kilobit(
    1000,
    symbol: 'kb',
  ),

  /// 10^3 bytes ~~ 1000 bytes
  kilobyte(
    1000 * 8,
    symbol: 'kB',
  ),

  /// 10^6 bits ~~ 1000^2 bits
  megabit(
    1000 * 1000,
    symbol: 'mb',
  ),

  /// 10^6 bytes ~~ 1000^2 bytes
  megabyte(
    1000 * 1000 * 8,
    symbol: 'mB',
  ),

  /// 10^9 bits ~~ 1000^3 bits
  gigabit(
    1000 * 1000 * 1000,
    symbol: 'gb',
  ),

  /// 10^9 bytes ~~ 1000^3 bytes
  gigabyte(
    1000 * 1000 * 1000 * 8,
    symbol: 'gB',
  ),

  /// 10^12 bits ~~ 1000^4 bits
  terabit(
    1000 * 1000 * 1000 * 1000,
    symbol: 'tb',
  ),

  /// 10^12 bytes ~~ 1000^4 bytes
  terabyte(
    1000 * 1000 * 1000 * 1000 * 8,
    symbol: 'tB',
  ),

  /// 10^15 bits ~~ 1000^5 bits
  petabit(
    1000 * 1000 * 1000 * 1000 * 1000,
    symbol: 'pb',
  ),

  /// 10^15 bytes ~~ 1000^5 bytes
  petabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbol: 'pB',
  ),

  /// 10^18 bits ~~ 1000^6 bits
  exabit(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000,
    symbol: 'eb',
  ),

  /// 10^18 bytes ~~ 1000^6 bytes
  exabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbol: 'eB',
  ),

  /// 10^21 bits ~~ 1000^7 bits
  zettabit(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000,
    symbol: 'zb',
  ),

  /// 10^21 bytes ~~ 1000^7 bytes
  zettabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbol: 'zB',
  ),

  /// 10^24 bits ~~ 1000^8 bits
  yottabit(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000,
    symbol: 'yb',
  ),

  /// 10^24 bytes ~~ 1000^8 bytes
  yottabyte(
    1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 1000 * 8,
    symbol: 'yB',
  ),

  /// 2^10 bits ~~ 1024 bits
  kibibit(1 << 10, symbol: 'kib'),

  /// 2^10 bytes ~~ 1024 bytes
  kibibyte((1 << 10) << 3, symbol: 'kiB'),

  /// 2^20 bits ~~ 1024^2 bits
  mebibit(1 << 20, symbol: 'mib'),

  /// 2^20 bytes ~~ 1024^2 bytes
  mebibyte((1 << 20) << 3, symbol: 'miB'),

  /// 2^30 bits ~~ 1024^3 bits
  gibibit(1 << 30, symbol: 'gib'),

  /// 2^30 bytes ~~ 1024^3 bytes
  gibibyte((1 << 30) << 3, symbol: 'giB'),

  /// 2^40 bits ~~ 1024^4 bits
  tebibit(1 << 40, symbol: 'tib'),

  /// 2^40 bytes ~~ 1024^4 bytes
  tebibyte((1 << 40) << 3, symbol: 'tiB'),

  /// 2^50 bits ~~ 1024^5 bits
  pebibit(1 << 50, symbol: 'pib'),

  /// 2^50 bytes ~~ 1024^5 bytes
  pebibyte((1 << 50) << 3, symbol: 'piB'),

  /// 2^60 bits ~~ 1024^6 bits
  exbibit(1 << 60, symbol: 'eib'),

  /// 2^60 bytes ~~ 1024^6 bytes
  exbibyte((1 << 60) << 3, symbol: 'eiB'),

  /// 2^70 bits ~~ 1024^7 bits
  zebibit(1 << 70, symbol: 'zib'),

  /// 2^70 bytes ~~ 1024^7 bytes
  zebibyte((1 << 70) << 3, symbol: 'ziB'),

  /// 2^80 bits ~~ 1024^8 bits
  yobibit(1 << 80, symbol: 'yib'),

  /// 2^80 bytes ~~ 1024^8 bytes
  yobibyte((1 << 80) << 3, symbol: 'yiB');

  final int bits;
  final String symbol;

  const Unit(this.bits, {required this.symbol});

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
