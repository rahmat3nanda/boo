part of 'match.soul.page.dart';

class _MatchSoulController extends BooUIController
    with GetSingleTickerProviderStateMixin {
  late final TabController menuController = TabController(
    length: _MatchSoulMenu.values.length,
    vsync: this,
  );

  final Rx<_MatchSoulMenu> menu = Rx<_MatchSoulMenu>(
    _MatchSoulMenu.values.first,
  );

  final RxList<Profile> data = RxList<Profile>(<Profile>[
    Profile(
      medias: <ProfileMedia>[
        const ProfileMedia(
          url: 'https://picsum.photos/id/1011/800/1200',
          thumbnail: 'https://picsum.photos/id/1011/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 245678,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
      ],
      verified: true,
      fullname: 'Andi Pratama',
      username: 'andiprtm',
      bio: 'Tech enthusiast, coffee lover ☕',
      prompts: const <ProfilePrompt>[
        ProfilePrompt(
          question: 'A perfect weekend?',
          answer: 'Exploring new cafes and coding side projects.',
        ),
      ],
      birthday: DateTime(1998, 4, 12),
      school: 'Institut Teknologi Bandung',
      work: 'Software Engineer',
      location: const ProfileLocation(
        city: ProfileLocationCity(name: 'Bandung'),
        country: ProfileLocationCountry(name: 'Indonesia'),
        province: ProfileLocationProvince(name: 'West Java'),
      ),
      gender: ProfileGenderType.male,
      personality: ProfilePersonalityType.intj,
      relationshipStatus: ProfileRelationshipStatus.single,
      relationshipType: ProfileRelationshipType.monogamous,
      lookingForType: ProfileLookingForType.dating,
      lookingForSubtype: ProfileLookingForSubtype.longTermPartner,
      interests: const <ProfileInterest>[
        ProfileInterest(name: 'Technology'),
        ProfileInterest(name: 'Coffee'),
      ],
      languages: const <ProfileLanguage>[
        ProfileLanguage(type: ProfileLanguageType.indonesian),
        ProfileLanguage(type: ProfileLanguageType.english),
      ],
      zodiac: ProfileZodiacType.aries,
    ),

    Profile(
      medias: <ProfileMedia>[
        const ProfileMedia(
          url: 'https://picsum.photos/id/1027/800/1200',
          thumbnail: 'https://picsum.photos/id/1027/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 312000,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
        const ProfileMedia(
          url: 'https://picsum.photos/id/1027/800/1200',
          thumbnail: 'https://picsum.photos/id/1027/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 312000,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
      ],
      verified: false,
      fullname: 'Nadia Putri',
      username: 'nadiaptr',
      bio: 'Designer by day, painter by night 🎨',
      prompts: const <ProfilePrompt>[
        ProfilePrompt(
          question: 'My passion',
          answer: 'Turning ideas into beautiful visuals.',
        ),
      ],
      birthday: DateTime(1997, 9, 3),
      school: 'Universitas Indonesia',
      work: 'UI/UX Designer',
      location: const ProfileLocation(
        city: ProfileLocationCity(name: 'Jakarta'),
        country: ProfileLocationCountry(name: 'Indonesia'),
        province: ProfileLocationProvince(name: 'DKI Jakarta'),
      ),
      gender: ProfileGenderType.female,
      personality: ProfilePersonalityType.infp,
      relationshipStatus: ProfileRelationshipStatus.single,
      relationshipType: ProfileRelationshipType.monogamous,
      lookingForType: ProfileLookingForType.dating,
      lookingForSubtype: ProfileLookingForSubtype.shortTermFun,
      interests: const <ProfileInterest>[
        ProfileInterest(name: 'Art'),
        ProfileInterest(name: 'Design'),
      ],
      languages: const <ProfileLanguage>[
        ProfileLanguage(type: ProfileLanguageType.indonesian),
        ProfileLanguage(type: ProfileLanguageType.english),
      ],
      zodiac: ProfileZodiacType.virgo,
    ),

    Profile(
      medias: <ProfileMedia>[
        const ProfileMedia(
          url: 'https://picsum.photos/id/1005/800/1200',
          thumbnail: 'https://picsum.photos/id/1005/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 289000,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
      ],
      verified: true,
      fullname: 'Rizky Mahendra',
      username: 'rizkymah',
      bio: 'Fitness, travel, and good food.',
      prompts: const <ProfilePrompt>[
        ProfilePrompt(
          question: 'You should date me if…',
          answer: 'You enjoy spontaneous trips.',
        ),
      ],
      birthday: DateTime(1996, 1, 20),
      school: 'Universitas Gadjah Mada',
      work: 'Business Consultant',
      location: const ProfileLocation(
        city: ProfileLocationCity(name: 'Yogyakarta'),
        country: ProfileLocationCountry(name: 'Indonesia'),
        province: ProfileLocationProvince(name: 'DI Yogyakarta'),
      ),
      gender: ProfileGenderType.male,
      personality: ProfilePersonalityType.entj,
      relationshipStatus: ProfileRelationshipStatus.single,
      relationshipType: ProfileRelationshipType.monogamous,
      lookingForType: ProfileLookingForType.dating,
      lookingForSubtype: ProfileLookingForSubtype.longTermOpenToShort,
      interests: const <ProfileInterest>[
        ProfileInterest(name: 'Fitness'),
        ProfileInterest(name: 'Travel'),
      ],
      languages: const <ProfileLanguage>[
        ProfileLanguage(type: ProfileLanguageType.indonesian),
        ProfileLanguage(type: ProfileLanguageType.english),
      ],
      zodiac: ProfileZodiacType.capricorn,
    ),

    Profile(
      medias: <ProfileMedia>[
        const ProfileMedia(
          url: 'https://picsum.photos/id/1012/800/1200',
          thumbnail: 'https://picsum.photos/id/1012/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 330120,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
      ],
      verified: false,
      fullname: 'Siti Rahma',
      username: 'srahma',
      bio: 'Bookworm 📚 and nature lover.',
      prompts: const <ProfilePrompt>[
        ProfilePrompt(
          question: 'Favorite place?',
          answer: 'Quiet beaches and mountain trails.',
        ),
      ],
      birthday: DateTime(1999, 6, 15),
      school: 'Universitas Padjadjaran',
      work: 'Content Writer',
      location: const ProfileLocation(
        city: ProfileLocationCity(name: 'Cimahi'),
        country: ProfileLocationCountry(name: 'Indonesia'),
        province: ProfileLocationProvince(name: 'West Java'),
      ),
      gender: ProfileGenderType.female,
      personality: ProfilePersonalityType.isfp,
      relationshipStatus: ProfileRelationshipStatus.single,
      relationshipType: ProfileRelationshipType.monogamous,
      lookingForType: ProfileLookingForType.friend,
      interests: const <ProfileInterest>[
        ProfileInterest(name: 'Reading'),
        ProfileInterest(name: 'Nature'),
      ],
      languages: const <ProfileLanguage>[
        ProfileLanguage(type: ProfileLanguageType.indonesian),
      ],
      zodiac: ProfileZodiacType.gemini,
    ),

    Profile(
      medias: <ProfileMedia>[
        const ProfileMedia(
          url: 'https://picsum.photos/id/1016/800/1200',
          thumbnail: 'https://picsum.photos/id/1016/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 298450,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
      ],
      verified: true,
      fullname: 'Kevin Jonathan',
      username: 'kevinj',
      bio: 'Startup life & late-night brainstorming.',
      prompts: const <ProfilePrompt>[
        ProfilePrompt(
          question: 'What drives you?',
          answer: 'Building impactful products.',
        ),
      ],
      birthday: DateTime(1995, 11, 2),
      school: 'Binus University',
      work: 'Product Manager',
      location: const ProfileLocation(
        city: ProfileLocationCity(name: 'Jakarta'),
        country: ProfileLocationCountry(name: 'Indonesia'),
        province: ProfileLocationProvince(name: 'DKI Jakarta'),
      ),
      gender: ProfileGenderType.male,
      personality: ProfilePersonalityType.entp,
      relationshipStatus: ProfileRelationshipStatus.single,
      relationshipType: ProfileRelationshipType.monogamous,
      lookingForType: ProfileLookingForType.dating,
      lookingForSubtype: ProfileLookingForSubtype.shortTermOpenToLong,
      interests: const <ProfileInterest>[
        ProfileInterest(name: 'Startups'),
        ProfileInterest(name: 'Networking'),
      ],
      languages: const <ProfileLanguage>[
        ProfileLanguage(type: ProfileLanguageType.indonesian),
        ProfileLanguage(type: ProfileLanguageType.english),
      ],
      zodiac: ProfileZodiacType.scorpio,
    ),

    Profile(
      medias: <ProfileMedia>[
        const ProfileMedia(
          url: 'https://picsum.photos/id/1021/800/1200',
          thumbnail: 'https://picsum.photos/id/1021/300/450',
          metadata: ProfileMediaMetadata(
            mime: 'image/jpeg',
            size: 276000,
            width: 800,
            height: 1200,
            type: ProfileMediaType.image,
            duration: 0,
          ),
        ),
      ],
      verified: false,
      fullname: 'Ayu Lestari',
      username: 'ayulstr',
      bio: 'Yoga, mindfulness, and good vibes ✨',
      prompts: const <ProfilePrompt>[
        ProfilePrompt(
          question: 'My ideal day',
          answer: 'Morning yoga and sunset walks.',
        ),
      ],
      birthday: DateTime(2000, 2, 18),
      school: 'Universitas Airlangga',
      work: 'Wellness Coach',
      location: const ProfileLocation(
        city: ProfileLocationCity(name: 'Surabaya'),
        country: ProfileLocationCountry(name: 'Indonesia'),
        province: ProfileLocationProvince(name: 'East Java'),
      ),
      gender: ProfileGenderType.female,
      personality: ProfilePersonalityType.enfj,
      relationshipStatus: ProfileRelationshipStatus.single,
      relationshipType: ProfileRelationshipType.monogamous,
      lookingForType: ProfileLookingForType.dating,
      lookingForSubtype: ProfileLookingForSubtype.longTermOpenToShort,
      interests: const <ProfileInterest>[
        ProfileInterest(name: 'Yoga'),
        ProfileInterest(name: 'Wellness'),
      ],
      languages: const <ProfileLanguage>[
        ProfileLanguage(type: ProfileLanguageType.indonesian),
        ProfileLanguage(type: ProfileLanguageType.english),
      ],
      zodiac: ProfileZodiacType.aquarius,
    ),
  ]);

  late final Rxn<Profile> show = Rxn<Profile>(data.first);

  @override
  void onClose() {
    menuController.dispose();
    super.onClose();
  }

  void onMenuChanged(int index) {
    menu.value = _MatchSoulMenu.values[index];
  }

  void onBoost() {
    BooNavigation.i.delegate<MatchNavigationDelegate>().showSubscription();
  }

  void onDislike() {
    BooToast.success(title: 'Dislike ${show.value?.fullname ?? ''}');
    data.removeAt(0);
    show.value = data.firstOrNull;
  }

  void onSuperLike() {
    BooNavigation.i.delegate<MatchNavigationDelegate>().showSubscription();
  }

  void onLike() {
    BooToast.success(title: 'Like ${show.value?.fullname ?? ''}');
    data.removeAt(0);
    show.value = data.firstOrNull;
  }

  void onMessage() {
    BooNavigation.i.delegate<MatchNavigationDelegate>().showSubscription();
  }
}
