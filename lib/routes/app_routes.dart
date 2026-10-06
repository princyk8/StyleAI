import 'package:flutter/material.dart';

import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/onboarding/presentation/try_outfits_screen.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/explore/presentation/explore_screen.dart';

import '../features/try_on/presentation/choose_photo_screen.dart';
import '../features/try_on/presentation/try_on_result_screen.dart';

import '../features/outfit/presentation/choose_outfit_screen.dart';
import '../features/outfit/presentation/outfit_detail_screen.dart';

import '../features/saved/presentation/saved_screen.dart';
import '../features/stylist/presentation/stylist_screen.dart';

import '../features/recommendations/presentation/recommendations_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

class AppRoutes {
  AppRoutes._();

  // ------------------------------------------------------------
  // ROUTE NAMES
  // ------------------------------------------------------------

  static const String onboarding = '/';
  static const String tryOutfits = '/try-outfits';

  static const String home = '/home';
  static const String explore = '/explore';

  static const String choosePhoto = '/choose-photo';
  static const String chooseOutfit = '/choose-outfit';
  static const String outfitDetail = '/outfit-detail';

  static const String tryOnResult = '/try-on-result';

  static const String saved = '/saved';
  static const String stylist = '/stylist';
  static const String recommendations = '/recommendations';
  static const String profile = '/profile';

  // ------------------------------------------------------------
  // ROUTE GENERATOR
  // ------------------------------------------------------------

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // ----------------------------------------------------------
    // ONBOARDING
    // ----------------------------------------------------------

      case onboarding:
        return _page(
          const OnboardingScreen(),
          settings,
        );

      case tryOutfits:
        return _page(
          const TryOutfitsScreen(),
          settings,
        );

    // ----------------------------------------------------------
    // MAIN
    // ----------------------------------------------------------

      case home:
        return _page(
          const HomeScreen(),
          settings,
        );

      case explore:
        return _page(
          const ExploreScreen(),
          settings,
        );

    // ----------------------------------------------------------
    // TRY ON
    // ----------------------------------------------------------

      case choosePhoto:
        return _page(
          const ChoosePhotoScreen(),
          settings,
        );

      case chooseOutfit:
        return _page(
          const ChooseOutfitScreen(),
          settings,
        );

      case tryOnResult:
        return _page(
          const TryOnResultScreen(),
          settings,
        );

    // ----------------------------------------------------------
    // OUTFIT
    // ----------------------------------------------------------

      case outfitDetail:
        return _page(
          const OutfitDetailScreen(
            title: 'Elegant Style',
          ),
          settings,
        );

    // ----------------------------------------------------------
    // OTHER SCREENS
    // ----------------------------------------------------------

      case saved:
        return _page(
          const SavedScreen(),
          settings,
        );

      case stylist:
        return _page(
          const StylistScreen(),
          settings,
        );

      case recommendations:
        return _page(
          const RecommendationsScreen(),
          settings,
        );

      case profile:
        return _page(
          const ProfileScreen(),
          settings,
        );

    // ----------------------------------------------------------
    // UNKNOWN ROUTE
    // ----------------------------------------------------------

      default:
        return _page(
          const OnboardingScreen(),
          settings,
        );
    }
  }

  // ------------------------------------------------------------
  // PAGE BUILDER
  // ------------------------------------------------------------

  static MaterialPageRoute<dynamic> _page(
      Widget child,
      RouteSettings settings,
      ) {
    return MaterialPageRoute(
      builder: (_) => child,
      settings: settings,
    );
  }
}