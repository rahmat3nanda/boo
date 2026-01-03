enum ProfileRelationshipType {
  monogamous,
  polyamorous,
  open;

  static ProfileRelationshipType? from(String? s) => switch (s) {
    'monogamous' => monogamous,
    'polyamorous' => polyamorous,
    'open' => open,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    monogamous => 'monogamous',
    polyamorous => 'polyamorous',
    open => 'open',
  };

  String get tr => switch (this) {
    monogamous => 'Monogamous',
    polyamorous => 'Polyamorous',
    open => 'Open relationship',
  };
}
