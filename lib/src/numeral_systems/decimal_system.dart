import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';

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
