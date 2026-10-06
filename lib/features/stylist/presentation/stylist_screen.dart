import 'package:flutter/material.dart';

class StylistScreen extends StatelessWidget {
  const StylistScreen({super.key});

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
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      width: 42,
                      height: 42,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 19,
                        color: Color(0xFF292633),
                      ),
                    ),
                  ),

                  const Expanded(
                    child: Text(
                      'AI Stylist',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),
                  ),

                  const SizedBox(width: 42),
                ],
              ),
            ),

            // =====================================================
            // CONTENT
            // =====================================================
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------------------------------
                    // AI STYLIST HEADER
                    // -------------------------------------------------
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE8FF),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              color: Color(0xFF7452E8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.auto_awesome_rounded,
                              color: Colors.white,
                              size: 34,
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            'Your Personal Stylist',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF292633),
                            ),
                          ),

                          const SizedBox(height: 7),

                          const Text(
                            'Get personalized outfit ideas based '
                                'on your style and occasion.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Color(0xFF777383),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // SECTION TITLE
                    // -------------------------------------------------
                    const Text(
                      'What are you looking for?',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 13),

                    // -------------------------------------------------
                    // STYLE OPTIONS
                    // -------------------------------------------------
                    _StyleOption(
                      icon: Icons.work_outline_rounded,
                      title: 'Work Outfit',
                      subtitle: 'Professional looks for the office',
                      onTap: () {},
                    ),

                    const SizedBox(height: 10),

                    _StyleOption(
                      icon: Icons.favorite_border_rounded,
                      title: 'Date Night',
                      subtitle: 'Stylish looks for a special evening',
                      onTap: () {},
                    ),

                    const SizedBox(height: 10),

                    _StyleOption(
                      icon: Icons.weekend_outlined,
                      title: 'Casual Day',
                      subtitle: 'Comfortable everyday outfits',
                      onTap: () {},
                    ),

                    const SizedBox(height: 10),

                    _StyleOption(
                      icon: Icons.celebration_outlined,
                      title: 'Party Look',
                      subtitle: 'Stand out at your next event',
                      onTap: () {},
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // STYLE PREFERENCES
                    // -------------------------------------------------
                    const Text(
                      'Your Style',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _StyleChip(text: 'Elegant'),
                        _StyleChip(text: 'Casual'),
                        _StyleChip(text: 'Minimal'),
                        _StyleChip(text: 'Trendy'),
                        _StyleChip(text: 'Classic'),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // -------------------------------------------------
                    // GET RECOMMENDATIONS
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          // Recommendation functionality
                          // will be connected later.
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
                            Icon(
                              Icons.auto_awesome_rounded,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Get Recommendations',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
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
// STYLE OPTION
// ================================================================

class _StyleOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _StyleOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: const Color(0xFFE5E1EF),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8FF),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF7452E8),
                size: 21,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF292633),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF777383),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF9A96A5),
              size: 21,
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// STYLE CHIP
// ================================================================

class _StyleChip extends StatelessWidget {
  final String text;

  const _StyleChip({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE5E1EF),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF7452E8),
        ),
      ),
    );
  }
}