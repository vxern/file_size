import 'package:human_file_size/src/numeral_systems/decimal_numeral_system.dart';
import 'package:human_file_size/src/output_formatters/simple_output_formatter.dart';
import 'package:human_file_size/src/quantity_display_modes/simple_quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_conversions/best_fit_unit_conversion.dart';
import 'package:human_file_size/src/unit_styles/short_uppercase_unit_style.dart';
import 'package:intl/intl.dart';

/// The default unit is [Unit.byte].
final defaultUnit = Unit.byte;

/// The default unit conversion is [BestFitUnitConversion] with the
/// [DecimalNumeralSystem].
const defaultUnitConversion =
    BestFitUnitConversion(numeralSystem: DecimalNumeralSystem());

/// The default quantity display mode is [SimpleQuantityDisplayMode].
const defaultQuantityDisplayMode = SimpleQuantityDisplayMode();

/// The default number format is [NumberFormat.decimalPattern].
final defaultNumberFormat = NumberFormat.decimalPattern();

/// The default unit style is [ShortUppercaseUnitStyle].
const defaultUnitStyle = ShortUppercaseUnitStyle();

/// The default number format is [SimpleOutputFormatter].
const defaultOutputFormatter = SimpleOutputFormatter();
