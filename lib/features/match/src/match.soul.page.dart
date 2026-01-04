import 'dart:ui' show ImageFilter;

import 'package:boo/cores/account/enums/profile.gender.type.dart'
    show ProfileGenderType;
import 'package:boo/cores/account/enums/profile.language.type.dart'
    show ProfileLanguageType;
import 'package:boo/cores/account/enums/profile.looking_for.subtype.dart'
    show ProfileLookingForSubtype;
import 'package:boo/cores/account/enums/profile.looking_for.type.dart'
    show ProfileLookingForType;
import 'package:boo/cores/account/enums/profile.media.type.dart'
    show ProfileMediaType;
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
    show
        ProfileLocation,
        ProfileLocationCity,
        ProfileLocationCountry,
        ProfileLocationProvince;
import 'package:boo/cores/account/models/profile/profile.media.model.dart'
    show ProfileMedia, ProfileMediaMetadata;
import 'package:boo/cores/account/models/profile/profile.model.dart'
    show Profile;
import 'package:boo/cores/account/models/profile/profile.prompt.model.dart'
    show ProfilePrompt;
import 'package:boo/cores/core/core.dart' show BooNavigation, BooUIController;
import 'package:boo/features/match/match.navigation.dart'
    show MatchNavigationDelegate;
import 'package:boo/shared/ui/colors/color.dart' show BooColor, BooColorBase;
import 'package:boo/shared/ui/styles/styles.dart' show GradientDirection;
import 'package:boo/shared/ui/widgets/widgets.dart'
    show BooUIGradientBoxBorder, BooUIImage, BooUIInfiniteListView, BooUISvg;
import 'package:boo/shared/utils/const.dart' show bNavBar;
import 'package:flutter/material.dart'
    show
        BackdropFilter,
        Border,
        BorderRadius,
        BoxDecoration,
        BoxShape,
        ClipRRect,
        Container,
        Curves,
        EdgeInsets,
        GestureDetector,
        MainAxisAlignment,
        NeverScrollableScrollPhysics,
        PageController,
        Positioned,
        Row,
        SliverAppBar,
        Stack,
        StatelessWidget,
        TabController,
        VoidCallback,
        Widget;
import 'package:get/get.dart'
    show
        Get,
        GetBuilder,
        GetNavigation,
        GetSingleTickerProviderStateMixin,
        ObxValue,
        Rx,
        RxList;

part 'match.soul.controller.dart';
part 'match.soul.menu.dart';

class MatchSoulPage extends StatelessWidget {
  const MatchSoulPage({super.key});

  @override
  Widget build(_) => GetBuilder<_MatchSoulController>(
    init: _MatchSoulController(),
    builder: (_MatchSoulController controller) => Stack(
      children: <Widget>[
        Positioned.fill(
          child: ObxValue<Rx<Profile>>(
            (Rx<Profile> show) => _mainView(profile: show.value),
            controller.show,
          ),
        ),
        Positioned(
          bottom: bNavBar + 32,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 4,
            children: <Widget>[
              _button(
                onTap: controller.onBoost,
                icon: 'assets/svg/rocket.svg',
                color: BooColor.get.turquoise1,
                size: 48,
              ),
              _button(
                onTap: controller.onDislike,
                icon: 'assets/svg/cross.svg',
                size: 64,
              ),
              _button(
                onTap: controller.onSuperLike,
                icon: 'assets/svg/like.svg',
                color: BooColor.get.rosePink,
                size: 48,
              ),
              _button(
                onTap: controller.onLike,
                icon: 'assets/svg/like.svg',
                color: BooColor.get.turquoise1,
                size: 64,
              ),
              _button(
                onTap: controller.onMessage,
                icon: 'assets/svg/send.svg',
                size: 48,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _mainView({required Profile profile}) => BooUIInfiniteListView(
    primary: false,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    headers: <Widget>[
      SliverAppBar(
        toolbarHeight: Get.mediaQuery.size.height * .6,
        title: _imageView(url: profile.medias?.firstOrNull?.thumbnail ?? ''),
      ),
    ],
    children: <Widget>[],
  );

  Widget _imageView({required String url}) => _cardView(
    width: double.infinity,
    height: Get.mediaQuery.size.height * .6,
    child: BooUIImage(network: url, borderRadius: BorderRadius.circular(16)),
  );

  Widget _cardView({required Widget child, double? width, double? height}) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: BooColor.get.border.value),
        ),
        child: child,
      );

  Widget _button({
    required String icon,
    required double size,
    VoidCallback? onTap,
    BooColorBase? color,
  }) => GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4),
        child: Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: BooUIGradientBoxBorder(
              width: 1.5,
              direction: GradientDirection.topToDown,
              colors: <BooColorBase>[
                BooColor.get.text,
                BooColor.get.text,
                BooColor.get.scaffold,
                BooColor.get.text,
                BooColor.get.text,
              ],
            ),
          ),
          child: BooUISvg(
            asset: icon,
            color: color,
            width: size - 12,
            height: size - 12,
          ),
        ),
      ),
    ),
  );
}
