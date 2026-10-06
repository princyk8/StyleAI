import 'package:flutter/material.dart';

// onboarding
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/onboarding/presentation/try_outfits_screen.dart';

// home
import 'features/home/presentation/home_screen.dart';

// explore
import 'features/explore/presentation/explore_screen.dart';

// try on
import 'features/try_on/presentation/choose_photo_screen.dart';
import 'features/try_on/presentation/try_on_result_screen.dart';

// outfit
import 'features/outfit/presentation/choose_outfit_screen.dart';
//import 'features/outfit/presentation/outfit_detail_screen.dart';

// saved
import 'features/saved/presentation/saved_screen.dart';

// recommendations
import 'features/recommendations/presentation/recommendations_screen.dart';

// stylist
import 'features/stylist/presentation/stylist_screen.dart';

// profile
import 'features/profile/presentation/profile_screen.dart';

// ads
import 'features/ads/presentation/ad_screen.dart';

class StyleAIApp extends StatelessWidget {
  const StyleAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StyleAI',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F7FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7452E8),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8F7FF),
          foregroundColor: Color(0xFF292633),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),

        '/try-outfits': (context) => const TryOutfitsScreen(),

        '/home': (context) => const HomeScreen(),

        '/explore': (context) => const ExploreScreen(),

        '/choose-photo': (context) => const ChoosePhotoScreen(),

        '/try-on-result': (context) =>
        const TryOnResultScreen(),

        '/choose-outfit': (context) =>
        const ChooseOutfitScreen(),

        '/saved': (context) => const SavedScreen(),

        '/recommendations': (context) =>
        const RecommendationsScreen(),

        '/stylist': (context) => const StylistScreen(),

        '/profile': (context) => const ProfileScreen(),

        // -------------------------------------------------------
        // AD SCREEN
        // -------------------------------------------------------
        '/ad': (context) => const AdScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      },
    );
  }
}