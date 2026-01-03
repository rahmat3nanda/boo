enum ProfilePersonalityType {
  intj,
  intp,
  entj,
  entp,
  infj,
  infp,
  enfj,
  enfp,
  istj,
  isfj,
  estj,
  esfj,
  istp,
  isfp,
  estp,
  esfp;

  static ProfilePersonalityType? from(String? s) => switch (s) {
    'intj' => intj,
    'intp' => intp,
    'entj' => entj,
    'entp' => entp,
    'infj' => infj,
    'infp' => infp,
    'enfj' => enfj,
    'enfp' => enfp,
    'istj' => istj,
    'isfj' => isfj,
    'estj' => estj,
    'esfj' => esfj,
    'istp' => istp,
    'isfp' => isfp,
    'estp' => estp,
    'esfp' => esfp,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    intj => 'intj',
    intp => 'intp',
    entj => 'entj',
    entp => 'entp',
    infj => 'infj',
    infp => 'infp',
    enfj => 'enfj',
    enfp => 'enfp',
    istj => 'istj',
    isfj => 'isfj',
    estj => 'estj',
    esfj => 'esfj',
    istp => 'istp',
    isfp => 'isfp',
    estp => 'estp',
    esfp => 'esfp',
  };

  String get tr => toString().toUpperCase();
}
