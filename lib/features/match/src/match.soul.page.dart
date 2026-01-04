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
    show
        BooUIDev,
        BooUIGradientBoxBorder,
        BooUIImage,
        BooUIInfiniteListView,
        BooUIStaggered,
        BooUISvg,
        BooUIText,
        SliverCenter;
import 'package:boo/shared/utils/const.dart' show bNavBar;
import 'package:boo/shared/utils/extensions/list.string.dart'
    show ListJoinString;
import 'package:boo/shared/utils/extensions/string.compare.dart'
    show StringCompare;
import 'package:flutter/material.dart'
    show
        BackdropFilter,
        Border,
        BorderRadius,
        BoxDecoration,
        BoxShape,
        Center,
        ClipRRect,
        Column,
        Container,
        CrossAxisAlignment,
        Curves,
        EdgeInsets,
        Flexible,
        FontWeight,
        GestureDetector,
        Icon,
        Icons,
        ListView,
        MainAxisAlignment,
        MainAxisSize,
        NeverScrollableScrollPhysics,
        PageController,
        PageView,
        Positioned,
        Row,
        SizedBox,
        SliverAppBar,
        SliverFillRemaining,
        Stack,
        StatelessWidget,
        TabBar,
        TabController,
        TextOverflow,
        VoidCallback,
        Widget;
import 'package:get/get.dart'
    show
        Get,
        GetBuilder,
        GetNavigation,
        GetSingleTickerProviderStateMixin,
        Obx,
        Rx,
        RxList;
import 'package:tab_indicator_styler/tab_indicator_styler.dart'
    show MaterialIndicator;

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
          child: Obx(
            () => _mainView(
              profile: controller.show.value,
              controller: controller.menuController,
              pageController: controller.menuPageController,
              selected: controller.menu.value,
              onChanged: controller.onMenuChanged,
            ),
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

  Widget _mainView({
    required Profile profile,
    required TabController controller,
    required PageController pageController,
    required _MatchSoulMenu selected,
    required Function(int index) onChanged,
  }) => BooUIInfiniteListView(
    headers: <Widget>[
      const SizedBox(height: 24),
      SliverAppBar(
        toolbarHeight: Get.mediaQuery.size.height * .6,
        title: _appBarView(profile: profile),
        bottom: TabBar(
          controller: controller,
          onTap: onChanged,
          tabs: _MatchSoulMenu.values
              .map(
                (_MatchSoulMenu e) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  child: BooUIText(
                    e.title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: e == selected
                        ? BooColor.get.text
                        : BooColor.get.border,
                  ),
                ),
              )
              .toList(),
          dividerHeight: 0,
          indicator: MaterialIndicator(
            topLeftRadius: 24,
            topRightRadius: 24,
            bottomLeftRadius: 24,
            bottomRightRadius: 24,
            color: BooColor.get.turquoise1.value,
          ),
        ),
      ),
    ],
    footers: <Widget>[
      SliverCenter(
        sliver: SliverFillRemaining(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              _profileView(profile: profile),
              const Center(child: BooUIDev()),
              const Center(child: BooUIDev()),
            ],
          ),
        ),
      ),
    ],
    children: const <Widget>[],
  );

  Widget _appBarView({required Profile profile}) => Stack(
    children: <Widget>[
      _imageView(url: profile.medias?.firstOrNull?.thumbnail ?? ''),
      Positioned(
        bottom: 16,
        right: 16,
        left: 16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              spacing: 12,
              children: <Widget>[
                Flexible(
                  child: BooUIText(
                    profile.fullname ?? '',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (profile.verified ?? false)
                  Icon(
                    Icons.verified,
                    color: BooColor.get.turquoise1.value,
                    size: 24,
                  ),
              ],
            ),
            if (profile.work.isNotEmptyAndNotNull)
              Row(
                spacing: 4,
                children: <Widget>[
                  Icon(
                    Icons.work_outline,
                    color: BooColor.get.text.value,
                    size: 12,
                  ),
                  Flexible(
                    child: BooUIText(
                      profile.work ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            if (profile.school.isNotEmptyAndNotNull)
              Row(
                spacing: 4,
                children: <Widget>[
                  Icon(
                    Icons.school_outlined,
                    color: BooColor.get.text.value,
                    size: 12,
                  ),
                  Flexible(
                    child: BooUIText(
                      profile.school ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            if (profile.location != null)
              Row(
                spacing: 4,
                children: <Widget>[
                  Icon(
                    Icons.location_on_outlined,
                    color: BooColor.get.text.value,
                    size: 12,
                  ),
                  Flexible(
                    child: BooUIText(
                      <String?>[
                        profile.location?.city?.name,
                        profile.location?.province?.name,
                        profile.location?.country?.name,
                      ].nullableJoin(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            BooUIStaggered(
              children: <Widget>[
                _chipHeader(
                  value: '${profile.yearsOld}',
                  prefix: Icon(
                    profile.gender == ProfileGenderType.male
                        ? Icons.male
                        : Icons.female,
                    color: profile.gender == ProfileGenderType.male
                        ? BooColor.get.turquoise1.value
                        : BooColor.get.rosePink.value,
                    size: 16,
                  ),
                ),
                if (profile.personality != null)
                  _chipHeader(value: profile.personality?.tr ?? ''),
                if (profile.zodiac != null)
                  _chipHeader(value: profile.zodiac?.tr ?? ''),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget _chipHeader({required String value, Widget? prefix}) => Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      border: BooUIGradientBoxBorder(
        colors: <BooColorBase>[
          BooColor.get.text,
          BooColor.get.scaffold,
          BooColor.get.text,
        ],
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: <Widget>[if (prefix != null) prefix, BooUIText(value)],
    ),
  );

  Widget _profileView({required Profile profile}) => ListView(
    primary: false,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    children: <Widget>[
      _imageView(url: profile.medias?.firstOrNull?.thumbnail ?? ''),
    ],
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
