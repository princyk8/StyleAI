import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../home/presentation/home_screen.dart';
import '../../outfit/presentation/outfit_detail_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../saved/presentation/saved_screen.dart';
import '../../try_on/presentation/choose_photo_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() =>
      _ExploreScreenState();
}

class _ExploreScreenState
    extends State<ExploreScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'All',
    'Casual',
    'Formal',
    'Party',
    'Sport',
  ];

  final List<_OutfitData> _outfits = [
    _OutfitData(
      title: 'Elegant Style',
      category: 'Formal',
      description:
      'A polished and sophisticated everyday look.',
      style: 'Elegant',
      occasion: 'Everyday',
      season: 'All Season',
    ),
    _OutfitData(
      title: 'Casual Chic',
      category: 'Casual',
      description:
      'A relaxed look with a clean modern touch.',
      style: 'Casual',
      occasion: 'Everyday',
      season: 'Spring',
    ),
    _OutfitData(
      title: 'Weekend Look',
      category: 'Casual',
      description:
      'An effortless outfit for your weekend plans.',
      style: 'Casual',
      occasion: 'Weekend',
      season: 'All Season',
    ),
    _OutfitData(
      title: 'Date Night',
      category: 'Party',
      description:
      'A stylish outfit made for special evenings.',
      style: 'Party',
      occasion: 'Date Night',
      season: 'All Season',
    ),
    _OutfitData(
      title: 'Office Ready',
      category: 'Formal',
      description:
      'A professional look with a modern silhouette.',
      style: 'Formal',
      occasion: 'Office',
      season: 'All Season',
    ),
    _OutfitData(
      title: 'Sporty Comfort',
      category: 'Sport',
      description:
      'Comfortable activewear for your daily movement.',
      style: 'Sport',
      occasion: 'Workout',
      season: 'Summer',
    ),
    _OutfitData(
      title: 'Modern Classic',
      category: 'Formal',
      description:
      'Classic pieces styled with a contemporary feel.',
      style: 'Classic',
      occasion: 'Work',
      season: 'All Season',
    ),
    _OutfitData(
      title: 'Party Ready',
      category: 'Party',
      description:
      'A bold look designed for celebrations.',
      style: 'Party',
      occasion: 'Party',
      season: 'Winter',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredOutfits =
    _selectedCategory == 0
        ? _outfits
        : _outfits
        .where(
          (outfit) =>
      outfit.category ==
          _categories[
          _selectedCategory],
    )
        .toList();

    return Scaffold(
      backgroundColor:
      AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),

            Expanded(
              child: SingleChildScrollView(
                physics:
                const BouncingScrollPhysics(),
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  8,
                  20,
                  24,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),

                    const SizedBox(
                      height: 16,
                    ),

                    _buildCategorySelector(),

                    const SizedBox(
                      height: 22,
                    ),

                    _buildSectionTitle(),

                    const SizedBox(
                      height: 14,
                    ),

                    _buildOutfitGrid(
                      filteredOutfits,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      _buildBottomNavigationBar(),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
    return SizedBox(
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment:
            Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons
                    .arrow_back_ios_new_rounded,
                size: 19,
              ),
              color:
              AppColors.textPrimary,
            ),
          ),

          Text(
            'Explore',
            style: TextStyle(
              color:
              AppColors.textPrimary,
              fontSize: 18,
              fontWeight:
              FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SEARCH BAR
  // ============================================================

  Widget _buildSearchBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),

          Icon(
            Icons.search_rounded,
            size: 22,
            color:
            AppColors.textSecondary,
          ),

          const SizedBox(
            width: 11,
          ),

          Expanded(
            child: Text(
              'Search outfits, styles...',
              style: TextStyle(
                color:
                AppColors
                    .textSecondary,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CATEGORY SELECTOR
  // ============================================================

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection:
        Axis.horizontal,
        physics:
        const BouncingScrollPhysics(),
        itemCount:
        _categories.length,
        separatorBuilder:
            (_, __) =>
        const SizedBox(
          width: 9,
        ),
        itemBuilder:
            (context, index) {
          final bool selected =
              _selectedCategory ==
                  index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory =
                    index;
              });
            },
            child:
            AnimatedContainer(
              duration:
              const Duration(
                milliseconds: 180,
              ),
              padding:
              const EdgeInsets
                  .symmetric(
                horizontal: 17,
              ),
              alignment:
              Alignment.center,
              decoration:
              BoxDecoration(
                color: selected
                    ? AppColors.primary
                    : Colors.white,
                borderRadius:
                BorderRadius
                    .circular(22),
                border:
                Border.all(
                  color: selected
                      ? AppColors.primary
                      : AppColors.border,
                ),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : AppColors
                      .textSecondary,
                  fontSize: 11,
                  fontWeight:
                  FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle() {
    return Row(
      children: [
        Text(
          'Recommended Outfits',
          style: TextStyle(
            color:
            AppColors.textPrimary,
            fontSize: 18,
            fontWeight:
            FontWeight.w700,
          ),
        ),

        const Spacer(),

        Text(
          '${_filteredCount()} looks',
          style: TextStyle(
            color:
            AppColors.textSecondary,
            fontSize: 11,
            fontWeight:
            FontWeight.w500,
          ),
        ),
      ],
    );
  }

  int _filteredCount() {
    if (_selectedCategory == 0) {
      return _outfits.length;
    }

    return _outfits
        .where(
          (outfit) =>
      outfit.category ==
          _categories[
          _selectedCategory],
    )
        .length;
  }

  // ============================================================
  // OUTFIT GRID
  // ============================================================

  Widget _buildOutfitGrid(
      List<_OutfitData> outfits,
      ) {
    if (outfits.isEmpty) {
      return Container(
        width: double.infinity,
        padding:
        const EdgeInsets.symmetric(
          vertical: 60,
        ),
        child: Column(
          children: [
            Icon(
              Icons
                  .checkroom_outlined,
              size: 48,
              color:
              AppColors
                  .textSecondary,
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              'No outfits found',
              style: TextStyle(
                color:
                AppColors
                    .textPrimary,
                fontSize: 15,
                fontWeight:
                FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics:
      const NeverScrollableScrollPhysics(),
      itemCount:
      outfits.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 20,
        childAspectRatio: 0.66,
      ),
      itemBuilder:
          (context, index) {
        final outfit =
        outfits[index];

        return _OutfitCard(
          outfit: outfit,
          onTap: () {
            _openOutfitDetails(
              outfit,
            );
          },
        );
      },
    );
  }

  // ============================================================
  // OPEN OUTFIT DETAILS
  // ============================================================

  void _openOutfitDetails(
      _OutfitData outfit,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            OutfitDetailScreen(
              title: outfit.title,
            ),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        border:
        Border(
          top:
          BorderSide(
            color:
            AppColors.border,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _navItem(
              icon: Icons.home_outlined,
              activeIcon:
              Icons.home_rounded,
              label: 'Home',
              selected: false,
              onTap: () {
                Navigator
                    .pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const HomeScreen(),
                  ),
                      (route) => false,
                );
              },
            ),
          ),

          Expanded(
            child: _navItem(
              icon:
              Icons.explore_outlined,
              activeIcon:
              Icons.explore_rounded,
              label: 'Explore',
              selected: true,
              onTap: () {},
            ),
          ),

          Expanded(
            child:
            GestureDetector(
              behavior:
              HitTestBehavior
                  .opaque,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const ChoosePhotoScreen(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  width: 53,
                  height: 53,
                  decoration:
                  BoxDecoration(
                    color:
                    AppColors.primary,
                    shape:
                    BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color:
                    Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: _navItem(
              icon: Icons
                  .bookmark_border_rounded,
              activeIcon:
              Icons.bookmark_rounded,
              label: 'Saved',
              selected: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const SavedScreen(),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: _navItem(
              icon:
              Icons.person_outline_rounded,
              activeIcon:
              Icons.person_rounded,
              label: 'Profile',
              selected: false,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const ProfileScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior:
      HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Icon(
            selected
                ? activeIcon
                : icon,
            size: 22,
            color: selected
                ? AppColors.primary
                : AppColors
                .textSecondary,
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            label,
            style: TextStyle(
              color: selected
                  ? AppColors.primary
                  : AppColors
                  .textSecondary,
              fontSize: 10,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// OUTFIT CARD
// ================================================================

class _OutfitCard
    extends StatelessWidget {
  final _OutfitData outfit;
  final VoidCallback onTap;

  const _OutfitCard({
    required this.outfit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(
                18,
              ),
              child: Image.asset(
                'assets/images/onboarding_model.jpg',
                width:
                double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            outfit.title,
            maxLines: 1,
            overflow:
            TextOverflow.ellipsis,
            style: TextStyle(
              color:
              AppColors.textPrimary,
              fontSize: 13,
              fontWeight:
              FontWeight.w700,
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          Row(
            children: [
              Container(
                padding:
                const EdgeInsets
                    .symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration:
                BoxDecoration(
                  color:
                  AppColors.purpleLight,
                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),
                ),
                child: Text(
                  outfit.category,
                  style: TextStyle(
                    color:
                    AppColors.primary,
                    fontSize: 9,
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),
              ),

              const Spacer(),

              const Icon(
                Icons
                    .arrow_forward_ios_rounded,
                size: 11,
                color:
                Color(0xFF777383),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ================================================================
// OUTFIT DATA
// ================================================================

class _OutfitData {
  final String title;
  final String category;
  final String description;
  final String style;
  final String occasion;
  final String season;

  const _OutfitData({
    required this.title,
    required this.category,
    required this.description,
    required this.style,
    required this.occasion,
    required this.season,
  });
}