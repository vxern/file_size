import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';

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
class BinaryNumeralSystem extends NumeralSystem {
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

  /// Returns an instance of [BinaryNumeralSystem].
  const BinaryNumeralSystem();
}

/// Alias of [BinaryNumeralSystem].
@Deprecated('Use [BinaryNumeralSystem] instead.')
typedef BinarylSystem = BinaryNumeralSystem;
