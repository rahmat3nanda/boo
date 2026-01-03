enum ProfileZodiacType {
  aries,
  taurus,
  gemini,
  cancer,
  leo,
  virgo,
  libra,
  scorpio,
  sagittarius,
  capricorn,
  aquarius,
  pisces;

  static ProfileZodiacType? from(String? s) => switch (s) {
    'aries' => aries,
    'taurus' => taurus,
    'gemini' => gemini,
    'cancer' => cancer,
    'leo' => leo,
    'virgo' => virgo,
    'libra' => libra,
    'scorpio' => scorpio,
    'sagittarius' => sagittarius,
    'capricorn' => capricorn,
    'aquarius' => aquarius,
    'pisces' => pisces,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    aries => 'aries',
    taurus => 'taurus',
    gemini => 'gemini',
    cancer => 'cancer',
    leo => 'leo',
    virgo => 'virgo',
    libra => 'libra',
    scorpio => 'scorpio',
    sagittarius => 'sagittarius',
    capricorn => 'capricorn',
    aquarius => 'aquarius',
    pisces => 'pisces',
  };

  String get tr => switch (this) {
    aries => 'Aries',
    taurus => 'Taurus',
    gemini => 'Gemini',
    cancer => 'Cancer',
    leo => 'Leo',
    virgo => 'Virgo',
    libra => 'Libra',
    scorpio => 'Scorpio',
    sagittarius => 'Sagittarius',
    capricorn => 'Capricorn',
    aquarius => 'Aquarius',
    pisces => 'Pisces',
  };
}
