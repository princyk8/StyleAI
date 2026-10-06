import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendations = [
      {
        'title': 'Elegant Evening',
        'category': 'Elegant',
        'image': 'assets/images/onboarding_model.jpg',
      },
      {
        'title': 'Casual Comfort',
        'category': 'Casual',
        'image': 'assets/images/onboarding_model.jpg',
      },
      {
        'title': 'Modern Classic',
        'category': 'Classic',
        'image': 'assets/images/onboarding_model.jpg',
      },
      {
        'title': 'Weekend Style',
        'category': 'Trendy',
        'image': 'assets/images/onboarding_model.jpg',
      },
    ];

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
                      'Recommendations',
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
                    // HEADER
                    // -------------------------------------------------
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(19),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE8FF),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: Color(0xFF7452E8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.auto_awesome_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),

                          const SizedBox(width: 13),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Picked for you',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF292633),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Looks selected based on your style.',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF777383),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // TITLE
                    // -------------------------------------------------
                    const Text(
                      'Recommended Outfits',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // -------------------------------------------------
                    // RECOMMENDATION GRID
                    // -------------------------------------------------
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recommendations.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 18,
                        childAspectRatio: 0.70,
                      ),
                      itemBuilder: (context, index) {
                        final outfit = recommendations[index];

                        return _RecommendationCard(
                          title: outfit['title']!,
                          category: outfit['category']!,
                          image: outfit['image']!,
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // REFRESH BUTTON
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          // Recommendation refresh functionality
                          // will be connected later.
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF7452E8),
                          side: const BorderSide(
                            color: Color(0xFF7452E8),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh_rounded,
                              size: 19,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Show More',
                              style: TextStyle(
                                fontSize: 13,
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
// RECOMMENDATION CARD
// ================================================================

class _RecommendationCard extends StatelessWidget {
  final String title;
  final String category;
  final String image;

  const _RecommendationCard({
    required this.title,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Outfit recommendation functionality will be connected later.
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: const Color(0xFFE5E1EF),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------------------------------------------------
              // IMAGE
              // -------------------------------------------------------
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // AI badge
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: 0.92,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.auto_awesome_rounded,
                              size: 11,
                              color: Color(0xFF7452E8),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'For You',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF292633),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Favorite
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 31,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: 0.92,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          size: 17,
                          color: Color(0xFF55515F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // -------------------------------------------------------
              // TEXT
              // -------------------------------------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  11,
                  8,
                  11,
                  11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF777383),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}