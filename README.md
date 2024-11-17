## Get a human representation of the size of your files.

### Usage

`file_size` exposes a single, heavily parametrised function `fileSizeToString()`.

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

By default, `fileSizeToString()` takes the size to be in bytes. You may specify otherwise by passing a different value for `inputUnit`:

```dart
// 1000 bytes -> 1 kilobyte
fileSizeToString(1000); // 1 KB

// 1 kilobit in bits
fileSizeToString(1000, inputUnit: Unit.bit); // 1 Kb

// 1 megabit in kilobits
fileSizeToString(1000, inputUnit: Unit.kilobit); // 1 Mb
```

By default, `fileSizeToString()` converts to the largest unit possible. You may specify otherwise by passing a different value for `unitConversion`:

```dart
// 1000 bytes -> 1 kilobyte
fileSizeToString(1000); // 1 Kb

// 1000 bytes -> 8000 bits
fileSizeToString(
  1000,
  unitConversion: SpecificUnitConversion(unit: Unit.bit),
); // 8000 b
```

By default, `fileSizeToString()` converts to the short, uppercase style. You may specify otherwise by passing a different value to `unitStyle`:

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

By default, `fileSizeToString()` uses a simple strategy to format the quantity. You may specify otherwise by passing a different value to `quantityDisplayMode`:

```dart
fileSizeToString(1); // 1 B

fileSizeToString(1.25); // 1.25 B

// If you were feeling extra Roman today, you could do:
fileSizeToString(
  1,
  quantityDisplayMode: CustomQuantityDisplayMode(
    converter: (quantity, {required unit}) => "XIX",
  ),
); // XIX B
```

The library is resilient to funky data being passed in, with the output unit always being the given [inputUnit]:

```dart
// Negative sizes
fileSizeToString(1000 * -2); // -2 KB

// Infinity
fileSizeToString(double.infinity); // ∞ B

// Negative infinity
fileSizeToString(double.negativeInfinity, inputUnit: Unit.kilobit); // -∞ Kb

// NaN
fileSizeToString(double.nan); // NaN B
```