/// Represents the numeral system of the units used.
enum NumeralSystem {
  /// The decimal numeral system, with the factor between sequential magnitudes
  /// being 1000 or 10^3. This is the common system used to represent sizes of
  /// data for regular users.
  ///
  /// The prefixes belonging to this system are kilo-, mega-, giga-, tera-,
  /// peta-, exa-, zetta-, and yotta-.
  ///
  /// Prefixes are abbreviated as K, M, G, T, P, E, Z, and Y respectively.
  ///
  /// Example units include Kilobits (Kb/Kbit) and Megabytes (MB/Mbyte).
  decimal,

  /// The binary numeral system, with the factor between sequential magnitudes
  /// being 1024 or 2^10. Commonly used in Linux systems.
  ///
  /// The prefixes belonging to this system are kibi-, mebi-, gibi-, tebi-,
  /// pebi-, exbi-, zebi-, and yobi-.
  ///
  /// Prefixes are abbreviated as Ki, Mi, Gi, Ti, Pi, Ei, Zi, and Yi
  /// respectively.
  ///
  /// Example units include Kibibits (Kib/Kibit) and Mebibytes (MiB/Mibyte).
  binary,
}
