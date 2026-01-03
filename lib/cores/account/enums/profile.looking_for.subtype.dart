enum ProfileLookingForSubtype {
  shortTermFun,
  longTermPartner,
  shortTermOpenToLong,
  longTermOpenToShort,
  undecided;

  static ProfileLookingForSubtype? from(String? s) => switch (s) {
    'short_term_fun' => shortTermFun,
    'long_term_partner' => longTermPartner,
    'short_term_open_to_long' => shortTermOpenToLong,
    'long_term_open_to_short' => longTermOpenToShort,
    'undecided' => undecided,
    _ => null,
  };

  @override
  String toString() => switch (this) {
    shortTermFun => 'short_term_fun',
    longTermPartner => 'long_term_partner',
    shortTermOpenToLong => 'short_term_open_to_long',
    longTermOpenToShort => 'long_term_open_to_short',
    undecided => 'undecided',
  };

  String get tr => switch (this) {
    shortTermFun => 'Short term fun',
    longTermPartner => 'Long term partner',
    shortTermOpenToLong => 'Short term, open to long',
    longTermOpenToShort => 'Long term, open to short',
    undecided => 'Undecided',
  };
}
