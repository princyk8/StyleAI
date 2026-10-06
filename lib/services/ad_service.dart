import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  AdService._();

  static final AdService instance = AdService._();

  InterstitialAd? _interstitialAd;

  bool _isLoading = false;

  // ------------------------------------------------------------
  // GOOGLE TEST INTERSTITIAL AD UNIT ID
  // ------------------------------------------------------------
  //
  // This is Google's official Android test ID.
  // Replace it with your real AdMob interstitial ID
  // only when your app is ready for production.
  //
  static const String _testAdUnitId =
      'ca-app-pub-3940256099942544/1033173712';

  // ------------------------------------------------------------
  // LOAD INTERSTITIAL AD
  // ------------------------------------------------------------

  void loadInterstitialAd() {
    if (_isLoading || _interstitialAd != null) {
      return;
    }

    _isLoading = true;

    InterstitialAd.load(
      adUnitId: _testAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _isLoading = false;

          _interstitialAd = ad;

          debugPrint('StyleAI: Interstitial ad loaded.');

          ad.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdShowedFullScreenContent: (Ad ad) {
                  debugPrint(
                    'StyleAI: Interstitial ad shown.',
                  );
                },

                onAdDismissedFullScreenContent: (Ad ad) {
                  debugPrint(
                    'StyleAI: Interstitial ad dismissed.',
                  );

                  ad.dispose();

                  _interstitialAd = null;

                  // Load the next ad for future use.
                  loadInterstitialAd();
                },

                onAdFailedToShowFullScreenContent:
                    (Ad ad, AdError error) {
                  debugPrint(
                    'StyleAI: Failed to show interstitial ad: '
                        '$error',
                  );

                  ad.dispose();

                  _interstitialAd = null;

                  // Try loading another ad.
                  loadInterstitialAd();
                },

                onAdClicked: (Ad ad) {
                  debugPrint(
                    'StyleAI: Interstitial ad clicked.',
                  );
                },

                onAdImpression: (Ad ad) {
                  debugPrint(
                    'StyleAI: Interstitial ad impression.',
                  );
                },
              );
        },

        onAdFailedToLoad: (LoadAdError error) {
          _isLoading = false;
          _interstitialAd = null;

          debugPrint(
            'StyleAI: Failed to load interstitial ad: '
                '$error',
          );
        },
      ),
    );
  }

  // ------------------------------------------------------------
  // SHOW INTERSTITIAL AD
  // ------------------------------------------------------------

  void showInterstitialAd({
    VoidCallback? onAdFinished,
  }) {
    final ad = _interstitialAd;

    // No ad is ready.
    //
    // Continue with the app instead of blocking the user.
    if (ad == null) {
      debugPrint(
        'StyleAI: No interstitial ad is ready.',
      );

      loadInterstitialAd();

      onAdFinished?.call();

      return;
    }

    // Remove reference immediately because
    // an interstitial can only be shown once.
    _interstitialAd = null;

    bool callbackCalled = false;

    void finish() {
      if (callbackCalled) {
        return;
      }

      callbackCalled = true;
      onAdFinished?.call();
    }

    ad.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdShowedFullScreenContent: (Ad ad) {
            debugPrint(
              'StyleAI: Interstitial ad shown.',
            );
          },

          onAdDismissedFullScreenContent: (Ad ad) {
            debugPrint(
              'StyleAI: Interstitial ad dismissed.',
            );

            ad.dispose();

            loadInterstitialAd();

            finish();
          },

          onAdFailedToShowFullScreenContent:
              (Ad ad, AdError error) {
            debugPrint(
              'StyleAI: Failed to show interstitial ad: '
                  '$error',
            );

            ad.dispose();

            loadInterstitialAd();

            finish();
          },

          onAdClicked: (Ad ad) {
            debugPrint(
              'StyleAI: Interstitial ad clicked.',
            );
          },

          onAdImpression: (Ad ad) {
            debugPrint(
              'StyleAI: Interstitial ad impression.',
            );
          },
        );

    ad.show();
  }

  // ------------------------------------------------------------
  // DISPOSE
  // ------------------------------------------------------------

  void dispose() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
    _isLoading = false;
  }
}