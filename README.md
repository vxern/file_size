## Get a human representation of the size of your files.

### Usage

`human_file_size` exposes a single, heavily parametrised function `fileSizeToString()`.

The most basic usage is as follows:

```dart
// 0 bytes, shown in bits
fileSizeToString(0); // 0 b

// Less than one byte
fileSizeToString(0.75); // 6 b

// 8 bytes
fileSizeToString(8); // 8 B

// 1.2 kilobytes in bytes
fileSizeToString(1000 * 1.2); // 1.2 KB

// 3 gigabytes in bytes
fileSizeToString(1000 * 1000 * 1000 * 3); // 3 GB
```

By default, `fileSizeToString()` takes the size to be in bytes (`inputUnit: Unit.byte`). You may specify otherwise by passing a different value for `inputUnit`:

```dart
// 1000 bytes -> 1 kilobyte
fileSizeToString(1000); // 1 KB

// 1 kilobit in bits
fileSizeToString(1000, inputUnit: Unit.bit); // 1 Kb

// 1 megabit in kilobits
fileSizeToString(1000, inputUnit: Unit.kilobit); // 1 Mb
```

The library provides decimal and binary units starting at bit and byte, then following through prefixes kilo-, mega-, giga-, tera-, peta-, exa-, zeta- and yota-. Custom units are supported.

By default, `fileSizeToString()` converts to the largest unit possible (`unitConversion: const BestFitConversion()`). You may specify otherwise by passing a different value for `unitConversion`:

```dart
// 1000 bytes -> 1 kilobyte
fileSizeToString(1000); // 1 Kb

// 1000 bytes -> 8000 bits
fileSizeToString(
  1000,
  unitConversion: SpecificUnitConversion(unit: Unit.bit),
); // 8000 b
```

You may also specify the numeral system used when using `BestFitConversion()`. The library has two built-in numeral systems: decimal and binary. To set the numeral system, pass a `numeralSystem` into `BestFitConversion()`:

```dart
// 1024 bytes -> 1 kibibyte
fileSizeToString(
  1024,
  unitConversion: const BestFitConversion(
    numeralSystem: BinarySystem(),
  ),
); // 1 KiB
```

By default, `fileSizeToString()` converts to the short, uppercase style (`unitStyle: const ShortUppercaseStyleConversion()`). You may specify otherwise by passing a different value to `unitStyle`:

```dart
fileSizeToString(1, inputUnit: Unit.gigabit); // Gb

fileSizeToString(
  1,
  inputUnit: Unit.gigabit,
  unitStyle: const ShortLowercaseStyle(),
); // gb

fileSizeToString(
  1,
  inputUnit: Unit.gigabit,
  unitStyle: const LongLowercaseStyle(),
); // gbit

fileSizeToString(
  1,
  inputUnit: Unit.gigabit,
  unitStyle: const LongUppercaseStyle(),
); // Gbit
```

By default, `fileSizeToString()` uses a simple strategy to format the quantity (`quantityDisplayMode: const SimpleDisplayMode()`). You may specify otherwise by passing a different value to `quantityDisplayMode`:

```dart
fileSizeToString(1); // 1 B

fileSizeToString(1.25); // 1.25 B

// If you were feeling extra Roman today, you could do:
fileSizeToString(
  1,
  quantityDisplayMode: CustomQuantityDisplayMode(
    converter: (quantity, {required unit}) => 'XIX',
  ),
); // XIX B
```

The library is resilient to funky quantities being passed in, with the output unit always being the given [inputUnit]:

```dart
// Negative sizes
fileSizeToString(1000 * -2); // -2 KB

// Infinity
fileSizeToString(double.infinity, inputUnit: Unit.gigabyte); // ∞ GB

// Negative infinity
fileSizeToString(double.negativeInfinity, inputUnit: Unit.kilobit); // -∞ Kb

// NaN
fileSizeToString(double.nan, inputUnit: Unit.exabit); // NaN Eb
```

For more information, have a browse through the exposed symbols and through the documentation on each of them.
