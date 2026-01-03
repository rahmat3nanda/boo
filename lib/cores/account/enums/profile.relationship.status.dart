enum ProfileRelationshipStatus {
  single,
  inRelationship,
  married,
  divorced,
  widowed;

  static ProfileRelationshipStatus? from(String? s) => switch (s) {
    'single' => single,
    'in_relationship' => inRelationship,
    'married' => married,
    'divorced' => divorced,
    'widowed' => widowed,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    single => 'single',
    inRelationship => 'in_relationship',
    married => 'married',
    divorced => 'divorced',
    widowed => 'widowed',
  };

  String get tr => switch (this) {
    single => 'Single',
    inRelationship => 'In a relationship',
    married => 'Married',
    divorced => 'Divorced',
    widowed => 'Widowed',
  };
}
