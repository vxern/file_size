import 'package:file_size/src/unit.dart';

/// Represents the numeral system of units.
abstract class NumeralSystem {
  /// A list of units in this numeral system, arranged in ascending order.
  List<Unit> get units;

  /// Returns an instance of [NumeralSystem].
  const NumeralSystem();
}

/// The decimal numeral system with the factor between sequential magnitudes
/// being 1000 or 10^3. This is the common system used to represent sizes of
/// data for regular users.
///
/// The prefixes belonging to this system are kilo-, mega-, giga-, tera-,
/// peta-, exa-, zetta-, and yotta-.
///
/// Prefixes are abbreviated as K, M, G, T, P, E, Z, and Y respectively.
///
/// Example units include Kilobits (Kb/Kbit) and Megabytes (MB/Mbyte).
class DecimalSystem extends NumeralSystem {
  static final List<Unit> _units = List.unmodifiable([
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

  @override
  List<Unit> get units => _units;

  /// Returns an instance of [DecimalSystem].
  const DecimalSystem();
}

/// The binary numeral system with the factor between sequential magnitudes
/// being 1024 or 2^10. Commonly used in Linux systems.
///
/// The prefixes belonging to this system are kibi-, mebi-, gibi-, tebi-,
/// pebi-, exbi-, zebi-, and yobi-.
///
/// Prefixes are abbreviated as Ki, Mi, Gi, Ti, Pi, Ei, Zi, and Yi
/// respectively.
///
/// Example units include Kibibits (Kib/Kibit) and Mebibytes (MiB/Mibyte).
class BinarySystem extends NumeralSystem {
  static final List<Unit> _units = List.unmodifiable([
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

  @override
  List<Unit> get units => _units;

  /// Returns an instance of [BinarySystem].
  const BinarySystem();
}
