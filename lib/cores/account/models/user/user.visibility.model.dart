class UserVisibility {
  const UserVisibility({this.hideContact, this.hideNearest, this.hideKeywords});

  final bool? hideContact;
  final bool? hideNearest;
  final List<String>? hideKeywords;
}
