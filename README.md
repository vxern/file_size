## A robust, customisable package to get a human representation of the size of your files.

### Usage

`human_file_size` exposes a function `humanFileSize()` and extension method `num.humanFileSize()`.

The most basic usage is as follows:

```dart
// 0 bytes, shown in bits
humanFileSize(0); // 0 b

// Less than one byte
humanFileSize(0.75); // 6 b

// 8 bytes
humanFileSize(8); // 8 B

// 1.2 kilobytes in bytes
humanFileSize(1000 * 1.2); // 1.2 KB

// 3 gigabytes in bytes
humanFileSize(1000 * 1000 * 1000 * 3); // 3 GB
```

Or, using the extension method:
```dart
10.humanFileSize(); // 10 B

51.22.humanFileSize(); // 51.22 B

1234.humanFileSize(); // 1.234 KB
```

By default, `humanFileSize()` takes the size to be in bytes (`inputUnit: Unit.byte`). You may specify otherwise by passing a different value for `inputUnit`:

```dart
// 1000 bytes -> 1 kilobyte
humanFileSize(1000); // 1 KB

// 1 kilobit in bits
humanFileSize(1000, inputUnit: Unit.bit); // 1 Kb

// 1 megabit in kilobits
humanFileSize(1000, inputUnit: Unit.kilobit); // 1 Mb
```

The library provides decimal and binary units starting at bit and byte, then following through prefixes kilo-, mega-, giga-, tera-, peta-, exa-, zeta- and yota-. Custom units are supported.

By default, `humanFileSize()` converts to the largest unit possible (`unitConversion: const BestFitConversion()`). You may specify otherwise by passing a different value for `unitConversion`:

```dart
// 1000 bytes -> 1 kilobyte
humanFileSize(1000); // 1 Kb

// 1000 bytes -> 8000 bits
humanFileSize(
  1000,
  unitConversion: SpecificUnitConversion(unit: Unit.bit),
); // 8000 b
```

By default, `humanFileSize()` uses a simple strategy to format the quantity (`quantityDisplayMode: const SimpleQuantityDisplayMode()`). You may specify otherwise by passing a different value to `quantityDisplayMode`:

```dart
// `SimpleQuantityDisplayMode` is the default mode.
humanFileSize(1); // 1 B

// `IntlQuantityDisplayMode` can be used for localisation.
humanFileSize(
  1.234,
  quantityDisplayMode: IntlQuantityDisplayMode(
    numberFormat: NumberFormat.decimalPattern('pl'),
  ),
); // 1,234 B
```

You may also specify the numeral system used when using `BestFitConversion()`. The library has two built-in numeral systems: decimal and binary. To set the numeral system, pass a `numeralSystem` into `BestFitConversion()`:

```dart
// 1024 bytes -> 1 kibibyte
humanFileSize(
  1024,
  unitConversion: const BestFitConversion(
    numeralSystem: BinarySystem(),
  ),
); // 1 KiB
```

By default, `humanFileSize()` converts to the short, uppercase style (`unitStyle: const ShortUppercaseStyleConversion()`). You may specify otherwise by passing a different value to `unitStyle`:

```dart
humanFileSize(1, inputUnit: Unit.gigabit); // Gb

humanFileSize(
  1,
  inputUnit: Unit.gigabit,
  unitStyle: const ShortLowercaseStyle(),
); // gb

humanFileSize(
  1,
  inputUnit: Unit.gigabit,
  unitStyle: const LongLowercaseStyle(),
); // gbit

humanFileSize(
  1,
  inputUnit: Unit.gigabit,
  unitStyle: const LongUppercaseStyle(),
); // Gbit
```

The library is resilient to funky quantities being passed in, with the output unit always being the given `inputUnit`:

```dart
// Negative sizes
humanFileSize(1000 * -2); // -2 KB

// Infinity
humanFileSize(double.infinity, inputUnit: Unit.gigabyte); // ∞ GB

// Negative infinity
humanFileSize(double.negativeInfinity, inputUnit: Unit.kilobit); // -∞ Kb

// NaN
humanFileSize(double.nan, inputUnit: Unit.exabit); // NaN Eb
```

You can perform size comparisons:

```dart
final byteCount = BigInt.from(50);

byteCount >= Unit.kilobit.bytes; // false

byteCount >= Unit.bit.bytes; // true
```

For more information, have a browse through the exposed symbols and through the documentation on each of them.
