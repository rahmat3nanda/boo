enum ProfileLookingForType {
  dating,
  friend;

  static ProfileLookingForType? from(String? s) => switch (s) {
    'dating' => dating,
    'friend' => friend,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    dating => 'dating',
    friend => 'friend',
  };

  String get tr => switch (this) {
    dating => 'Dating',
    friend => 'Friend',
  };
}
