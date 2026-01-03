import 'package:boo/cores/account/enums/profile.gender.type.dart'
    show ProfileGenderType;
import 'package:boo/cores/account/enums/profile.looking_for.subtype.dart'
    show ProfileLookingForSubtype;
import 'package:boo/cores/account/enums/profile.looking_for.type.dart'
    show ProfileLookingForType;
import 'package:boo/cores/account/enums/profile.personality.type.dart'
    show ProfilePersonalityType;
import 'package:boo/cores/account/enums/profile.relationship.status.dart'
    show ProfileRelationshipStatus;
import 'package:boo/cores/account/enums/profile.relationship.type.dart'
    show ProfileRelationshipType;
import 'package:boo/cores/account/enums/profile.zodiac.type.dart'
    show ProfileZodiacType;
import 'package:boo/cores/account/models/profile/profile.interest.model.dart'
    show ProfileInterest;
import 'package:boo/cores/account/models/profile/profile.language.model.dart'
    show ProfileLanguage;
import 'package:boo/cores/account/models/profile/profile.location.model.dart'
    show ProfileLocation;
import 'package:boo/cores/account/models/profile/profile.media.model.dart'
    show ProfileMedia;
import 'package:boo/cores/account/models/profile/profile.prompt.model.dart'
    show ProfilePrompt;

class Profile {
  const Profile({
    this.id,
    this.medias,
    this.verified,
    this.fullname,
    this.username,
    this.bio,
    this.prompts,
    this.birthday,
    this.school,
    this.work,
    this.location,
    this.gender,
    this.personality,
    this.relationshipStatus,
    this.relationshipType,
    this.lookingForType,
    this.lookingForSubtype,
    this.interests,
    this.languages,
    this.zodiac,
  });

  final String? id;
  final List<ProfileMedia>? medias;
  final bool? verified;
  final String? fullname;
  final String? username;
  final String? bio;
  final List<ProfilePrompt>? prompts;
  final DateTime? birthday;
  final String? school;
  final String? work;
  final ProfileLocation? location;
  final ProfileGenderType? gender;
  final ProfilePersonalityType? personality;
  final ProfileRelationshipStatus? relationshipStatus;
  final ProfileRelationshipType? relationshipType;
  final ProfileLookingForType? lookingForType;
  final ProfileLookingForSubtype? lookingForSubtype;
  final List<ProfileInterest>? interests;
  final List<ProfileLanguage>? languages;
  final ProfileZodiacType? zodiac;
}
