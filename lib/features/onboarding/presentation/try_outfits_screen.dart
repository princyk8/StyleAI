import 'package:flutter/material.dart';

import '../../home/presentation/home_screen.dart';

class TryOutfitsScreen extends StatelessWidget {
  const TryOutfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Column(
          children: [
            // =====================================================
            // TOP BAR
            // =====================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF7452E8),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =====================================================
            // MAIN CONTENT
            // =====================================================
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  22,
                  10,
                  22,
                  24,
                ),
                child: Column(
                  children: [
                    // -------------------------------------------------
                    // IMAGE
                    // -------------------------------------------------
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: SizedBox(
                        width: double.infinity,
                        height: 390,
                        child: Image.asset(
                          'assets/images/onboarding_model.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // TITLE
                    // -------------------------------------------------
                    const Text(
                      'Your Style, Your Way',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF292633),
                        fontSize: 28,
                        height: 1.15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // -------------------------------------------------
                    // DESCRIPTION
                    // -------------------------------------------------
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Explore different looks, discover outfits '
                            'you love, and find your perfect style.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF777383),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // FEATURES
                    // -------------------------------------------------
                    Row(
                      children: const [
                        Expanded(
                          child: _FeatureCard(
                            icon: Icons.checkroom_outlined,
                            title: 'Explore',
                            subtitle: 'Find new looks',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _FeatureCard(
                            icon: Icons.favorite_border_rounded,
                            title: 'Save',
                            subtitle: 'Keep your favorites',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _FeatureCard(
                            icon: Icons.auto_awesome_outlined,
                            title: 'Try On',
                            subtitle: 'See your style',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // -------------------------------------------------
                    // CONTINUE BUTTON
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7452E8),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start Exploring',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 19,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // -------------------------------------------------
                    // PAGE INDICATORS
                    // -------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        _Indicator(
                          width: 6,
                          active: false,
                        ),
                        SizedBox(width: 6),
                        _Indicator(
                          width: 22,
                          active: true,
                        ),
                        SizedBox(width: 6),
                        _Indicator(
                          width: 6,
                          active: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// FEATURE CARD
// ================================================================

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE7E4F0),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE8FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: Color(0xFF7452E8),
              size: 20,
            ),
          ),

          const SizedBox(height: 9),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF292633),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: Color(0xFF777383),
              fontSize: 9,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// PAGE INDICATOR
// ================================================================

class _Indicator extends StatelessWidget {
  final double width;
  final bool active;

  const _Indicator({
    required this.width,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 6,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF7452E8)
            : const Color(0xFFD9D4F0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}