import 'package:boo/cores/account/enums/profile.language.type.dart'
    show ProfileLanguageType;

class ProfileLanguage {
  const ProfileLanguage({this.id, this.type, this.usage});

  final String? id;
  final ProfileLanguageType? type;
  final int? usage;
}
