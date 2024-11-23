## 0.6.1

- Added `collection` as a dev dependency.
- Improved test suite by simplifying tests and adding more test cases.

## 0.6.0

- Split up the previously monolithic files into a file per class.
- Split up test files to match the layout of the codebase.
- Moved defaults into a new file `defaults.dart`.
- Renamed:
  - `BinarySystem` -> `BinaryNumeralSystem`
  - `DecimalSystem` -> `DecimalNumeralSystem`
  - `BestFitConversion` -> `BestFitUnitConversion`
  - `LongLowercaseStyle` -> `LongLowercaseUnitStyle`
  - `LongUppercaseStyle` -> `LongUppercaseUnitStyle`
  - `ShortLowercaseStyle` -> `ShortLowercaseUnitStyle`
  - `ShortUppercaseStyle` -> `ShortUppercaseUnitStyle`
- Added namespaced, enum-like constructors:
  - `NumeralSystem.binary()`
  - `NumeralSystem.decimal()`
  - `OutputFormat.simple()`
  - `QuantityDisplayMode.custom()`
  - `QuantityDisplayMode.intl()`
  - `QuantityDisplayMode.simple()`
  - `UnitConversion.bestFit()`
  - `UnitConversion.specific()`
  - `UnitStyle.longLowercase()`
  - `UnitStyle.longUppercase()`
  - `UnitStyle.shortLowercase()`
  - `UnitStyle.shortUppercase()`

## 0.5.1

- Added missing piece of documentation.

## 0.5.0

- Added `OutputFormatter` to format the produced output.

## 0.4.0

- Added `intl` as a dependency.
- Added `IntlQuantityDisplayMode`.
- Renamed `SimpleDisplayMode` to `SimpleQuantityDisplayMode` for consistency.
- Deprecated `CustomQuantityDisplayMode` in favour of concrete implementations of `QuantityDisplayMode`.

## 0.3.0

- Added method `bytes` to `Unit` for more natural comparisons.

## 0.2.0

- Renamed base method from `fileSizeToString` to `humanFileSize()`.
- Added extension method `humanFileSize` on `num`.

## 0.1.2

- Fixed pub.dev score.

## 0.1.1

- Fixed pub.dev score.

## 0.1.0

- Initial version.
