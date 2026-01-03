enum ProfileLanguageType {
  english,
  indonesian;

  static ProfileLanguageType? from(String? s) => switch (s) {
    'english' => english,
    'indonesian' => indonesian,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    english => 'english',
    indonesian => 'indonesian',
  };

  String get tr => switch (this) {
    english => 'English',
    indonesian => 'Bahasa Indonesia',
  };
}
