class ProfileLocation {
  const ProfileLocation({this.city, this.country, this.province});

  final ProfileLocationCity? city;
  final ProfileLocationCountry? country;
  final ProfileLocationProvince? province;
}

class ProfileLocationCountry {
  const ProfileLocationCountry({this.id, this.name});

  final String? id;
  final String? name;
}

class ProfileLocationProvince {
  const ProfileLocationProvince({this.id, this.name});

  final String? id;
  final String? name;
}

class ProfileLocationCity {
  const ProfileLocationCity({this.id, this.name});

  final String? id;
  final String? name;
}
