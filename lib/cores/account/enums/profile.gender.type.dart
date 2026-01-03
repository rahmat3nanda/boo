enum ProfileGenderType {
  male,
  female,
  nonBinary;

  static ProfileGenderType? from(String? s) => switch (s) {
    'male' => male,
    'female' => female,
    'non_binary' => nonBinary,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    male => 'male',
    female => 'female',
    nonBinary => 'non_binary',
  };

  String get tr => switch (this) {
    male => 'Male',
    female => 'Female',
    nonBinary => 'Non-binary',
  };
}
