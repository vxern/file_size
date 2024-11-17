import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/unit_symbols.dart';

/// The default unit is [Unit.byte].
final defaultUnit = Unit.byte;

/// Represents a unit used for describing the size of digital information.
///
/// The library defines a set of units that should cover all standard use cases,
/// but custom units can be defined simply by extending [Unit] as follows:
///
/// ```dart
/// extension ExoticUnit on Unit {
///   static final nibble = Unit(
///     BigInt.from(4),
///     symbols: const UnitSymbols(shortLowercase: 'nybl'),
///   );
/// }
/// ```
///
/// The library defines the following set of units:
/// - Basic:
///   - [bit]
///   - [byte]
/// - Decimal:
///   - [kilobit]
///   - [kilobyte]
///   - [megabit]
///   - [megabyte]
///   - [gigabit]
///   - [gigabyte]
///   - [terabit]
///   - [terabyte]
///   - [petabit]
///   - [petabyte]
///   - [exabit]
///   - [exabyte]
///   - [zettabit]
///   - [zettabyte]
///   - [yottabit]
///   - [yottabyte]
/// - Binary:
///   - [kibibit]
///   - [kibibyte]
///   - [mebibit]
///   - [mebibyte]
///   - [gibibit]
///   - [gibibyte]
///   - [tebibit]
///   - [tebibyte]
///   - [pebibit]
///   - [pebibyte]
///   - [exbibit]
///   - [exbibyte]
///   - [zebibit]
///   - [zebibyte]
///   - [yobibit]
///   - [yobibyte]
final class Unit {
  /// 1 bit
  static final bit = Unit(
    BigInt.from(1),
    symbols: const UnitSymbols(
      shortLowercase: 'b',
      longLowercase: 'bit',
      longUppercase: 'Bit',
    ),
    isIndivisible: true,
  );

  /// 8 bits
  static final byte = Unit(
    BigInt.from(8),
    symbols: const UnitSymbols(
      shortLowercase: 'B',
      longLowercase: 'byte',
      longUppercase: 'Byte',
    ),
  );

  /// 10^3 bits ~~ 1000 bits
  static final kilobit = Unit(
    BigInt.from(1000),
    symbols: const UnitSymbols(
      shortLowercase: 'kb',
      shortUppercase: 'Kb',
      longLowercase: 'kbit',
      longUppercase: 'Kbit',
    ),
  );

  /// 10^3 bytes ~~ 1000 bytes
  static final kilobyte = Unit(
    BigInt.from(1000) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'kB',
      shortUppercase: 'KB',
      longLowercase: 'kbyte',
      longUppercase: 'Kbyte',
    ),
  );

  /// 10^6 bits ~~ 1000^2 bits
  static final megabit = Unit(
    BigInt.from(1000).pow(2),
    symbols: const UnitSymbols(
      shortLowercase: 'mb',
      shortUppercase: 'Mb',
      longLowercase: 'mbit',
      longUppercase: 'Mbit',
    ),
  );

  /// 10^6 bytes ~~ 1000^2 bytes
  static final megabyte = Unit(
    BigInt.from(1000).pow(2) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'mB',
      shortUppercase: 'MB',
      longLowercase: 'mbyte',
      longUppercase: 'Mbyte',
    ),
  );

  /// 10^9 bits ~~ 1000^3 bits
  static final gigabit = Unit(
    BigInt.from(1000).pow(3),
    symbols: const UnitSymbols(
      shortLowercase: 'gb',
      shortUppercase: 'Gb',
      longLowercase: 'gbit',
      longUppercase: 'Gbit',
    ),
  );

  /// 10^9 bytes ~~ 1000^3 bytes
  static final gigabyte = Unit(
    BigInt.from(1000).pow(3) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'gB',
      shortUppercase: 'GB',
      longLowercase: 'gbyte',
      longUppercase: 'Gbyte',
    ),
  );

  /// 10^12 bits ~~ 1000^4 bits
  static final terabit = Unit(
    BigInt.from(1000).pow(4),
    symbols: const UnitSymbols(
      shortLowercase: 'tb',
      shortUppercase: 'Tb',
      longLowercase: 'tbit',
      longUppercase: 'Tbit',
    ),
  );

  /// 10^12 bytes ~~ 1000^4 bytes
  static final terabyte = Unit(
    BigInt.from(1000).pow(4) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'tB',
      shortUppercase: 'TB',
      longLowercase: 'tbyte',
      longUppercase: 'Tbyte',
    ),
  );

  /// 10^15 bits ~~ 1000^5 bits
  static final petabit = Unit(
    BigInt.from(1000).pow(5),
    symbols: const UnitSymbols(
      shortLowercase: 'pb',
      shortUppercase: 'Pb',
      longLowercase: 'pbit',
      longUppercase: 'Pbit',
    ),
  );

  /// 10^15 bytes ~~ 1000^5 bytes
  static final petabyte = Unit(
    BigInt.from(1000).pow(5) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'pB',
      shortUppercase: 'PB',
      longLowercase: 'pbyte',
      longUppercase: 'Pbyte',
    ),
  );

  /// 10^18 bits ~~ 1000^6 bits
  static final exabit = Unit(
    BigInt.from(1000).pow(6),
    symbols: const UnitSymbols(
      shortLowercase: 'eb',
      shortUppercase: 'Eb',
      longLowercase: 'ebit',
      longUppercase: 'Ebit',
    ),
  );

  /// 10^18 bytes ~~ 1000^6 bytes
  static final exabyte = Unit(
    BigInt.from(1000).pow(6) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'eB',
      shortUppercase: 'EB',
      longLowercase: 'ebyte',
      longUppercase: 'Ebyte',
    ),
  );

  /// 10^21 bits ~~ 1000^7 bits
  static final zettabit = Unit(
    BigInt.from(1000).pow(7),
    symbols: const UnitSymbols(
      shortLowercase: 'zb',
      shortUppercase: 'Zb',
      longLowercase: 'zbit',
      longUppercase: 'Zbit',
    ),
  );

  /// 10^21 bytes ~~ 1000^7 bytes
  static final zettabyte = Unit(
    BigInt.from(1000).pow(7) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'zB',
      shortUppercase: 'ZB',
      longLowercase: 'zbyte',
      longUppercase: 'Zbyte',
    ),
  );

  /// 10^24 bits ~~ 1000^8 bits
  static final yottabit = Unit(
    BigInt.from(1000).pow(8),
    symbols: const UnitSymbols(
      shortLowercase: 'yb',
      shortUppercase: 'Yb',
      longLowercase: 'ybit',
      longUppercase: 'Ybit',
    ),
  );

  /// 10^24 bytes ~~ 1000^8 bytes
  static final yottabyte = Unit(
    BigInt.from(1000).pow(8) * Unit.byte.bits,
    symbols: const UnitSymbols(
      shortLowercase: 'yB',
      shortUppercase: 'YB',
      longLowercase: 'ybyte',
      longUppercase: 'Ybyte',
    ),
  );

  /// 2^10 bits ~~ 1024 bits
  static final kibibit = Unit(
    BigInt.from(2).pow(10),
    symbols: const UnitSymbols(
      shortLowercase: 'kib',
      shortUppercase: 'Kib',
      longLowercase: 'kibit',
      longUppercase: 'Kibit',
    ),
  );

  /// 2^10 bytes ~~ 1024 bytes
  static final kibibyte = Unit(
    BigInt.from(2).pow(13),
    symbols: const UnitSymbols(
      shortLowercase: 'kiB',
      shortUppercase: 'KiB',
      longLowercase: 'kibyte',
      longUppercase: 'Kibyte',
    ),
  );

  /// 2^20 bits ~~ 1024^2 bits
  static final mebibit = Unit(
    BigInt.from(2).pow(20),
    symbols: const UnitSymbols(
      shortLowercase: 'mib',
      shortUppercase: 'Mib',
      longLowercase: 'mibit',
      longUppercase: 'Mibit',
    ),
  );

  /// 2^20 bytes ~~ 1024^2 bytes
  static final mebibyte = Unit(
    BigInt.from(2).pow(23),
    symbols: const UnitSymbols(
      shortLowercase: 'miB',
      shortUppercase: 'MiB',
      longLowercase: 'mibyte',
      longUppercase: 'Mibyte',
    ),
  );

  /// 2^30 bits ~~ 1024^3 bits
  static final gibibit = Unit(
    BigInt.from(2).pow(30),
    symbols: const UnitSymbols(
      shortLowercase: 'gib',
      shortUppercase: 'Gib',
      longLowercase: 'gibit',
      longUppercase: 'Gibit',
    ),
  );

  /// 2^30 bytes ~~ 1024^3 bytes
  static final gibibyte = Unit(
    BigInt.from(2).pow(33),
    symbols: const UnitSymbols(
      shortLowercase: 'giB',
      shortUppercase: 'GiB',
      longLowercase: 'gibyte',
      longUppercase: 'Gibyte',
    ),
  );

  /// 2^40 bits ~~ 1024^4 bits
  static final tebibit = Unit(
    BigInt.from(2).pow(40),
    symbols: const UnitSymbols(
      shortLowercase: 'tib',
      shortUppercase: 'Tib',
      longLowercase: 'tibit',
      longUppercase: 'Tibit',
    ),
  );

  /// 2^40 bytes ~~ 1024^4 bytes
  static final tebibyte = Unit(
    BigInt.from(2).pow(43),
    symbols: const UnitSymbols(
      shortLowercase: 'tiB',
      shortUppercase: 'TiB',
      longLowercase: 'tibyte',
      longUppercase: 'Tibyte',
    ),
  );

  /// 2^50 bits ~~ 1024^5 bits
  static final pebibit = Unit(
    BigInt.from(2).pow(50),
    symbols: const UnitSymbols(
      shortLowercase: 'pib',
      shortUppercase: 'Pib',
      longLowercase: 'pibit',
      longUppercase: 'Pibit',
    ),
  );

  /// 2^50 bytes ~~ 1024^5 bytes
  static final pebibyte = Unit(
    BigInt.from(2).pow(53),
    symbols: const UnitSymbols(
      shortLowercase: 'piB',
      shortUppercase: 'PiB',
      longLowercase: 'pibyte',
      longUppercase: 'Pibyte',
    ),
  );

  /// 2^60 bits ~~ 1024^6 bits
  static final exbibit = Unit(
    BigInt.from(2).pow(60),
    symbols: const UnitSymbols(
      shortLowercase: 'eib',
      shortUppercase: 'Eib',
      longLowercase: 'eibit',
      longUppercase: 'Eibit',
    ),
  );

  /// 2^60 bytes ~~ 1024^6 bytes
  static final exbibyte = Unit(
    BigInt.from(2).pow(63),
    symbols: const UnitSymbols(
      shortLowercase: 'eiB',
      shortUppercase: 'EiB',
      longLowercase: 'eibyte',
      longUppercase: 'Eibyte',
    ),
  );

  /// 2^70 bits ~~ 1024^7 bits
  static final zebibit = Unit(
    BigInt.from(2).pow(70),
    symbols: const UnitSymbols(
      shortLowercase: 'zib',
      shortUppercase: 'Zib',
      longLowercase: 'zibit',
      longUppercase: 'Zibit',
    ),
  );

  /// 2^70 bytes ~~ 1024^7 bytes
  static final zebibyte = Unit(
    BigInt.from(2).pow(73),
    symbols: const UnitSymbols(
      shortLowercase: 'ziB',
      shortUppercase: 'ZiB',
      longLowercase: 'zibyte',
      longUppercase: 'Zibyte',
    ),
  );

  /// 2^80 bits ~~ 1024^8 bits
  static final yobibit = Unit(
    BigInt.from(2).pow(80),
    symbols: const UnitSymbols(
      shortLowercase: 'yib',
      shortUppercase: 'Yib',
      longLowercase: 'yibit',
      longUppercase: 'Yibit',
    ),
  );

  /// 2^80 bytes ~~ 1024^8 bytes
  static final yobibyte = Unit(
    BigInt.from(2).pow(83),
    symbols: const UnitSymbols(
      shortLowercase: 'yiB',
      shortUppercase: 'YiB',
      longLowercase: 'yibyte',
      longUppercase: 'Yibyte',
    ),
  );

  /// The number of bits this unit is equivalent to.
  final BigInt bits;

  /// The symbols used to represent this unit.
  final UnitSymbols symbols;

  /// If set to true, fractional quantities of this unit will be rounded to a
  /// whole number.
  final bool isIndivisible;

  /// Returns an instance of [Unit].
  ///
  /// Use this constructor to create custom units.
  ///
  /// [bits] must be positive and must not be zero.
  const Unit(this.bits, {required this.symbols, this.isIndivisible = false});

  /// Given a [quantity], calculates the equivalent number of bits using this
  /// unit.
  Decimal quantityToBits(num quantity) =>
      Decimal.parse(quantity.toString()) * Decimal.fromBigInt(bits);

  /// Given a number of [bits], calculates the equivalent in quantity of this
  /// unit.
  Decimal bitsToQuantity(Decimal bits) =>
      (bits / Decimal.fromBigInt(this.bits)).toDecimal();

  @override
  String toString() => "Unit '${symbols.shortLowercase}'";
}
