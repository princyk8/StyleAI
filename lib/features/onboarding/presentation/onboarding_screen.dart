import 'package:flutter/material.dart';

import 'try_outfits_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Stack(
          children: [
            // ==================================================
            // MAIN CONTENT
            // ==================================================
            Column(
              children: [
                // ------------------------------------------------
                // HERO IMAGE
                // ------------------------------------------------
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      18,
                      18,
                      18,
                      0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/images/onboarding_model.jpg',
                            fit: BoxFit.cover,
                          ),

                          // Dark gradient
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.08),
                                  Colors.black.withValues(alpha: 0.18),
                                  Colors.black.withValues(alpha: 0.72),
                                ],
                              ),
                            ),
                          ),

                          // ------------------------------------------------
                          // BRAND
                          // ------------------------------------------------
                          Positioned(
                            left: 22,
                            top: 24,
                            child: Row(
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7452E8),
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: const Icon(
                                    Icons.auto_awesome_rounded,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'StyleAI',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ------------------------------------------------
                          // SKIP
                          // ------------------------------------------------
                          Positioned(
                            right: 20,
                            top: 28,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home',
                                );
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          // ------------------------------------------------
                          // HERO TEXT
                          // ------------------------------------------------
                          Positioned(
                            left: 22,
                            right: 22,
                            bottom: 28,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Try On.\nStyle Up.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                    height: 1.05,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Discover your style and try outfits\n'
                                      'virtually with AI.',
                                  style: TextStyle(
                                    color: Colors.white.withValues(
                                      alpha: 0.88,
                                    ),
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ==================================================
                // BOTTOM CONTENT
                // ==================================================
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      18,
                      22,
                      18,
                    ),
                    child: Column(
                      children: [
                        // ------------------------------------------------
                        // GET STARTED
                        // ------------------------------------------------
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const TryOutfitsScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(0xFF7452E8),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(17),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
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

                        const SizedBox(height: 15),

                        // ------------------------------------------------
                        // SIGN IN
                        // ------------------------------------------------
                        GestureDetector(
                          onTap: () {
                            // Sign-in functionality will be connected
                            // in the authentication step.
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF777383),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    color: Color(0xFF7452E8),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Spacer(),

                        // ------------------------------------------------
                        // PAGE INDICATORS
                        // ------------------------------------------------
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            _Indicator(
                              width: 22,
                              active: true,
                            ),
                            const SizedBox(width: 6),
                            _Indicator(
                              width: 6,
                              active: false,
                            ),
                            const SizedBox(width: 6),
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
          ],
        ),
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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