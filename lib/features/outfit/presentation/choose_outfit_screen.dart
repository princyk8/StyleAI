import 'package:flutter/material.dart';

import 'outfit_detail_screen.dart';

class ChooseOutfitScreen extends StatefulWidget {
  const ChooseOutfitScreen({super.key});

  @override
  State<ChooseOutfitScreen> createState() => _ChooseOutfitScreenState();
}

class _ChooseOutfitScreenState extends State<ChooseOutfitScreen> {
  int selectedOutfit = 0;

  final List<Map<String, String>> outfits = [
    {
      'title': 'Elegant Style',
      'category': 'Elegant',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Casual Chic',
      'category': 'Casual',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Weekend Look',
      'category': 'Casual',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Date Night',
      'category': 'Party',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Office Ready',
      'category': 'Formal',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Sporty Fit',
      'category': 'Sport',
      'image': 'assets/images/onboarding_model.jpg',
    },
  ];

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
                      'Choose Outfit',
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
                  18,
                  20,
                  24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------------------------------
                    // TITLE
                    // -------------------------------------------------
                    const Text(
                      'Choose an outfit',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Select the outfit you want to try on.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF777383),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -------------------------------------------------
                    // OUTFIT GRID
                    // -------------------------------------------------
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: outfits.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 18,
                        childAspectRatio: 0.70,
                      ),
                      itemBuilder: (context, index) {
                        final outfit = outfits[index];
                        final bool isSelected =
                            selectedOutfit == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOutfit = index;
                            });
                          },
                          child: _OutfitCard(
                            title: outfit['title']!,
                            category: outfit['category']!,
                            image: outfit['image']!,
                            selected: isSelected,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // -------------------------------------------------
                    // CONTINUE
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          final selected =
                          outfits[selectedOutfit];

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OutfitDetailScreen(
                                title: selected['title']!,
                              ),
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
                        child: const Text(
                          'Continue',
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
// OUTFIT CARD
// ================================================================

class _OutfitCard extends StatelessWidget {
  final String title;
  final String category;
  final String image;
  final bool selected;

  const _OutfitCard({
    required this.title,
    required this.category,
    required this.image,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: selected
              ? const Color(0xFF7452E8)
              : const Color(0xFFE5E1EF),
          width: selected ? 2 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
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

                  // Selection indicator
                  if (selected)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 29,
                        height: 29,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7452E8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 18,
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
                10,
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
    );
  }
}