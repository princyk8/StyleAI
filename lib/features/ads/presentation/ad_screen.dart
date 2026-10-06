import 'package:flutter/material.dart';

import '../../../services/ad_service.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({super.key});

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  bool _adStarted = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAd();
    });
  }

  void _startAd() {
    if (!mounted || _adStarted) {
      return;
    }

    _adStarted = true;

    Future.delayed(
      const Duration(milliseconds: 700),
          () {
        if (!mounted) {
          return;
        }

        AdService.instance.showInterstitialAd(
          onAdFinished: _openChoosePhoto,
        );
      },
    );
  }

  // ------------------------------------------------------------
  // GO TO CHOOSE PHOTO
  // ------------------------------------------------------------

  void _openChoosePhoto() {
    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      '/choose-photo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                // ------------------------------------------------
                // APP ICON
                // ------------------------------------------------
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7452E8),
                    borderRadius:
                    BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                ),

                const SizedBox(height: 24),

                // ------------------------------------------------
                // TITLE
                // ------------------------------------------------
                const Text(
                  'StyleAI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF292633),
                  ),
                ),

                const SizedBox(height: 9),

                const Text(
                  'Preparing your style experience...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF777383),
                  ),
                ),

                const SizedBox(height: 28),

                // ------------------------------------------------
                // LOADING INDICATOR
                // ------------------------------------------------
                const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(
                      Color(0xFF7452E8),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Advertisement',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9993A5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}