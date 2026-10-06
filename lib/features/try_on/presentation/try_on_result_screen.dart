import 'package:flutter/material.dart';

class TryOnResultScreen extends StatelessWidget {
  final String outfitTitle;

  const TryOnResultScreen({
    super.key,
    this.outfitTitle = 'Elegant Style',
  });

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
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
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
                      'Try On Result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: const SizedBox(
                      width: 42,
                      height: 42,
                      child: Icon(
                        Icons.share_outlined,
                        size: 21,
                        color: Color(0xFF292633),
                      ),
                    ),
                  ),
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
                  12,
                  20,
                  28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------------------------------
                    // RESULT IMAGE
                    // -------------------------------------------------
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 465,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/images/onboarding_model.jpg',
                              fit: BoxFit.cover,
                            ),

                            // Result label
                            Positioned(
                              top: 14,
                              left: 14,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(
                                    alpha: 0.92,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(18),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome_rounded,
                                      size: 14,
                                      color: Color(0xFF7452E8),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'AI Try On',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF292633),
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

                    const SizedBox(height: 18),

                    // -------------------------------------------------
                    // TITLE
                    // -------------------------------------------------
                    Text(
                      outfitTitle,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Here is how your selected outfit looks on you.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF777383),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // -------------------------------------------------
                    // ACTION BUTTONS
                    // -------------------------------------------------
                    Row(
                      children: [
                        Expanded(
                          child: _ActionButton(
                            icon: Icons.favorite_border_rounded,
                            title: 'Save',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _ActionButton(
                            icon: Icons.share_outlined,
                            title: 'Share',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // -------------------------------------------------
                    // TRY AGAIN
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 53,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                          const Color(0xFF7452E8),
                          side: const BorderSide(
                            color: Color(0xFF7452E8),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Text(
                          'Try Another Outfit',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
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
// ACTION BUTTON
// ================================================================

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE5E1EF),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 19,
              color: const Color(0xFF7452E8),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF292633),
              ),
            ),
          ],
        ),
      ),
    );
  }
}