import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app.dart';
import 'services/ad_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Google Mobile Ads SDK.
  await MobileAds.instance.initialize();

  // Start loading the interstitial ad in advance.
  AdService.instance.loadInterstitialAd();

  runApp(
    const StyleAIApp(),
  );
}