import 'package:decimal/decimal.dart';

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

enum NumeralSystem {
  decimal,
  binary,
}

final class Unit {
  /// 1 bit
  static final bit = Unit(
    BigInt.from(1),
    symbols: (
      shortLowercase: 'b',
      shortUppercase: 'b',
      longLowercase: 'bit',
      longUppercase: 'Bit',
    ),
  );

  /// 8 bits
  static final byte = Unit(
    BigInt.from(8),
    symbols: (
      shortLowercase: 'B',
      shortUppercase: 'B',
      longLowercase: 'byte',
      longUppercase: 'Byte',
    ),
  );

  /// 10^3 bits ~~ 1000 bits
  static final kilobit = Unit(
    BigInt.from(1000),
    symbols: (
      shortLowercase: 'kb',
      shortUppercase: 'Kb',
      longLowercase: 'kbit',
      longUppercase: 'Kbit',
    ),
  );

  /// 10^3 bytes ~~ 1000 bytes
  static final kilobyte = Unit(
    BigInt.from(1000) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'kB',
      shortUppercase: 'KB',
      longLowercase: 'kbyte',
      longUppercase: 'Kbyte',
    ),
  );

  /// 10^6 bits ~~ 1000^2 bits
  static final megabit = Unit(
    BigInt.from(1000).pow(2),
    symbols: (
      shortLowercase: 'mb',
      shortUppercase: 'Mb',
      longLowercase: 'mbit',
      longUppercase: 'Mbit',
    ),
  );

  /// 10^6 bytes ~~ 1000^2 bytes
  static final megabyte = Unit(
    BigInt.from(1000).pow(2) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'mB',
      shortUppercase: 'MB',
      longLowercase: 'mbyte',
      longUppercase: 'Mbyte',
    ),
  );

  /// 10^9 bits ~~ 1000^3 bits
  static final gigabit = Unit(
    BigInt.from(1000).pow(3),
    symbols: (
      shortLowercase: 'gb',
      shortUppercase: 'Gb',
      longLowercase: 'gbit',
      longUppercase: 'Gbit',
    ),
  );

  /// 10^9 bytes ~~ 1000^3 bytes
  static final gigabyte = Unit(
    BigInt.from(1000).pow(3) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'gB',
      shortUppercase: 'GB',
      longLowercase: 'gbyte',
      longUppercase: 'Gbyte',
    ),
  );

  /// 10^12 bits ~~ 1000^4 bits
  static final terabit = Unit(
    BigInt.from(1000).pow(4),
    symbols: (
      shortLowercase: 'tb',
      shortUppercase: 'Tb',
      longLowercase: 'tbit',
      longUppercase: 'Tbit',
    ),
  );

  /// 10^12 bytes ~~ 1000^4 bytes
  static final terabyte = Unit(
    BigInt.from(1000).pow(4) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'tB',
      shortUppercase: 'TB',
      longLowercase: 'tbyte',
      longUppercase: 'Tbyte',
    ),
  );

  /// 10^15 bits ~~ 1000^5 bits
  static final petabit = Unit(
    BigInt.from(1000).pow(5),
    symbols: (
      shortLowercase: 'pb',
      shortUppercase: 'Pb',
      longLowercase: 'pbit',
      longUppercase: 'Pbit',
    ),
  );

  /// 10^15 bytes ~~ 1000^5 bytes
  static final petabyte = Unit(
    BigInt.from(1000).pow(5) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'pB',
      shortUppercase: 'PB',
      longLowercase: 'pbyte',
      longUppercase: 'Pbyte',
    ),
  );

  /// 10^18 bits ~~ 1000^6 bits
  static final exabit = Unit(
    BigInt.from(1000).pow(6),
    symbols: (
      shortLowercase: 'eb',
      shortUppercase: 'Eb',
      longLowercase: 'ebit',
      longUppercase: 'Ebit',
    ),
  );

  /// 10^18 bytes ~~ 1000^6 bytes
  static final exabyte = Unit(
    BigInt.from(1000).pow(6) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'eB',
      shortUppercase: 'EB',
      longLowercase: 'ebyte',
      longUppercase: 'Ebyte',
    ),
  );

  /// 10^21 bits ~~ 1000^7 bits
  static final zettabit = Unit(
    BigInt.from(1000).pow(7),
    symbols: (
      shortLowercase: 'zb',
      shortUppercase: 'Zb',
      longLowercase: 'zbit',
      longUppercase: 'Zbit',
    ),
  );

  /// 10^21 bytes ~~ 1000^7 bytes
  static final zettabyte = Unit(
    BigInt.from(1000).pow(7) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'zB',
      shortUppercase: 'ZB',
      longLowercase: 'zbyte',
      longUppercase: 'Zbyte',
    ),
  );

  /// 10^24 bits ~~ 1000^8 bits
  static final yottabit = Unit(
    BigInt.from(1000).pow(8),
    symbols: (
      shortLowercase: 'yb',
      shortUppercase: 'Yb',
      longLowercase: 'ybit',
      longUppercase: 'Ybit',
    ),
  );

  /// 10^24 bytes ~~ 1000^8 bytes
  static final yottabyte = Unit(
    BigInt.from(1000).pow(8) * Unit.byte.bits,
    symbols: (
      shortLowercase: 'yB',
      shortUppercase: 'YB',
      longLowercase: 'ybyte',
      longUppercase: 'Ybyte',
    ),
  );

  /// 2^10 bits ~~ 1024 bits
  static final kibibit = Unit(
    BigInt.from(2).pow(10),
    symbols: (
      shortLowercase: 'kib',
      shortUppercase: 'Kib',
      longLowercase: 'kibit',
      longUppercase: 'Kibit',
    ),
  );

  /// 2^10 bytes ~~ 1024 bytes
  static final kibibyte = Unit(
    BigInt.from(2).pow(13),
    symbols: (
      shortLowercase: 'kiB',
      shortUppercase: 'KiB',
      longLowercase: 'kibyte',
      longUppercase: 'Kibyte',
    ),
  );

  /// 2^20 bits ~~ 1024^2 bits
  static final mebibit = Unit(
    BigInt.from(2).pow(20),
    symbols: (
      shortLowercase: 'mib',
      shortUppercase: 'Mib',
      longLowercase: 'mibit',
      longUppercase: 'Mibit',
    ),
  );

  /// 2^20 bytes ~~ 1024^2 bytes
  static final mebibyte = Unit(
    BigInt.from(2).pow(23),
    symbols: (
      shortLowercase: 'miB',
      shortUppercase: 'MiB',
      longLowercase: 'mibyte',
      longUppercase: 'Mibyte',
    ),
  );

  /// 2^30 bits ~~ 1024^3 bits
  static final gibibit = Unit(
    BigInt.from(2).pow(30),
    symbols: (
      shortLowercase: 'gib',
      shortUppercase: 'Gib',
      longLowercase: 'gibit',
      longUppercase: 'Gibit',
    ),
  );

  /// 2^30 bytes ~~ 1024^3 bytes
  static final gibibyte = Unit(
    BigInt.from(2).pow(33),
    symbols: (
      shortLowercase: 'giB',
      shortUppercase: 'GiB',
      longLowercase: 'gibyte',
      longUppercase: 'Gibyte',
    ),
  );

  /// 2^40 bits ~~ 1024^4 bits
  static final tebibit = Unit(
    BigInt.from(2).pow(40),
    symbols: (
      shortLowercase: 'tib',
      shortUppercase: 'Tib',
      longLowercase: 'tibit',
      longUppercase: 'Tibit',
    ),
  );

  /// 2^40 bytes ~~ 1024^4 bytes
  static final tebibyte = Unit(
    BigInt.from(2).pow(43),
    symbols: (
      shortLowercase: 'tiB',
      shortUppercase: 'TiB',
      longLowercase: 'tibyte',
      longUppercase: 'Tibyte',
    ),
  );

  /// 2^50 bits ~~ 1024^5 bits
  static final pebibit = Unit(
    BigInt.from(2).pow(50),
    symbols: (
      shortLowercase: 'pib',
      shortUppercase: 'Pib',
      longLowercase: 'pibit',
      longUppercase: 'Pibit',
    ),
  );

  /// 2^50 bytes ~~ 1024^5 bytes
  static final pebibyte = Unit(
    BigInt.from(2).pow(53),
    symbols: (
      shortLowercase: 'piB',
      shortUppercase: 'PiB',
      longLowercase: 'pibyte',
      longUppercase: 'Pibyte',
    ),
  );

  /// 2^60 bits ~~ 1024^6 bits
  static final exbibit = Unit(
    BigInt.from(2).pow(60),
    symbols: (
      shortLowercase: 'eib',
      shortUppercase: 'Eib',
      longLowercase: 'eibit',
      longUppercase: 'Eibit',
    ),
  );

  /// 2^60 bytes ~~ 1024^6 bytes
  static final exbibyte = Unit(
    BigInt.from(2).pow(63),
    symbols: (
      shortLowercase: 'eiB',
      shortUppercase: 'EiB',
      longLowercase: 'eibyte',
      longUppercase: 'Eibyte',
    ),
  );

  /// 2^70 bits ~~ 1024^7 bits
  static final zebibit = Unit(
    BigInt.from(2).pow(70),
    symbols: (
      shortLowercase: 'zib',
      shortUppercase: 'Zib',
      longLowercase: 'zibit',
      longUppercase: 'Zibit',
    ),
  );

  /// 2^70 bytes ~~ 1024^7 bytes
  static final zebibyte = Unit(
    BigInt.from(2).pow(73),
    symbols: (
      shortLowercase: 'ziB',
      shortUppercase: 'ZiB',
      longLowercase: 'zibyte',
      longUppercase: 'Zibyte',
    ),
  );

  /// 2^80 bits ~~ 1024^8 bits
  static final yobibit = Unit(
    BigInt.from(2).pow(80),
    symbols: (
      shortLowercase: 'yib',
      shortUppercase: 'Yib',
      longLowercase: 'yibit',
      longUppercase: 'Yibit',
    ),
  );

  /// 2^80 bytes ~~ 1024^8 bytes
  static final yobibyte = Unit(
    BigInt.from(2).pow(83),
    symbols: (
      shortLowercase: 'yiB',
      shortUppercase: 'YiB',
      longLowercase: 'yibyte',
      longUppercase: 'Yibyte',
    ),
  );

  static final List<Unit> decimal = List.unmodifiable([
    Unit.bit,
    Unit.byte,
    Unit.kilobit,
    Unit.kilobyte,
    Unit.megabit,
    Unit.megabyte,
    Unit.gigabit,
    Unit.gigabyte,
    Unit.terabit,
    Unit.terabyte,
    Unit.petabit,
    Unit.petabyte,
    Unit.exabit,
    Unit.exabyte,
    Unit.zettabit,
    Unit.zettabyte,
    Unit.yottabit,
    Unit.yottabyte,
  ]);

  static final List<Unit> binary = List.unmodifiable([
    Unit.bit,
    Unit.byte,
    Unit.kibibit,
    Unit.kibibyte,
    Unit.mebibit,
    Unit.mebibyte,
    Unit.gibibit,
    Unit.gibibyte,
    Unit.tebibit,
    Unit.tebibyte,
    Unit.pebibit,
    Unit.pebibyte,
    Unit.exbibit,
    Unit.exbibyte,
    Unit.zebibit,
    Unit.zebibyte,
    Unit.yobibit,
    Unit.yobibyte,
  ]);

  final BigInt bits;
  final UnitSymbols symbols;

  const Unit(this.bits, {required this.symbols});

  factory Unit.matchToSize({
    required BigInt bits,
    required NumeralSystem numeralSystem,
  }) {
    final units = switch (numeralSystem) {
      NumeralSystem.decimal => Unit.decimal,
      NumeralSystem.binary => Unit.binary,
    };
    for (final unit in units.reversed) {
      if (bits >= unit.bits) {
        return unit;
      }
    }

    return Unit.bit;
  }

  BigInt quantityToBits(num quantity) =>
      (Decimal.parse(quantity.toString()) * Decimal.fromBigInt(bits))
          .floor()
          .toBigInt();

  num bitsToQuantity(BigInt bits) => (bits / this.bits).floor();
}
