import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../explore/presentation/explore_screen.dart';
import '../../outfit/presentation/outfit_detail_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../saved/presentation/saved_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;

  final TextEditingController _searchController =
  TextEditingController();

  final List<Map<String, String>> _trendingLooks = [
    {
      'title': 'Casual Chic',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Office Ready',
      'image': 'assets/images/onboarding_model.jpg',
    },
    {
      'title': 'Date Night',
      'image': 'assets/images/onboarding_model.jpg',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _buildHomeContent(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ============================================================
  // HOME CONTENT
  // ============================================================

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        20,
        16,
        20,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),

          const SizedBox(height: 18),

          _buildSearchBar(),

          const SizedBox(height: 22),

          _buildHeroBanner(),

          const SizedBox(height: 28),

          _buildSectionHeader(
            title: 'Categories',
            action: 'See all',
            onTap: _openExplore,
          ),

          const SizedBox(height: 14),

          _buildCategories(),

          const SizedBox(height: 30),

          _buildSectionHeader(
            title: 'Trending Looks',
            action: 'See all',
            onTap: _openExplore,
          ),

          const SizedBox(height: 14),

          _buildTrendingLooks(),

          const SizedBox(height: 28),

          _buildTryOnCard(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'StyleAI',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Find your perfect style',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        _circleIconButton(
          icon: Icons.notifications_none_rounded,
          onTap: _showNotificationMessage,
        ),
      ],
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearchBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),

          Icon(
            Icons.search_rounded,
            size: 22,
            color: AppColors.textSecondary,
          ),

          const SizedBox(width: 11),

          Expanded(
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onChanged: (_) {
                setState(() {});
              },
              onSubmitted: (value) {
                final query = value.trim();

                if (query.isEmpty) {
                  _showSearchMessage();
                  return;
                }

                _openSearchResults(query);
              },
              decoration: const InputDecoration(
                hintText:
                'Search outfits, styles...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding:
                EdgeInsets.zero,
              ),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          if (_searchController.text.isNotEmpty)
            IconButton(
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
              icon: const Icon(
                Icons.close_rounded,
                size: 18,
              ),
            ),

          IconButton(
            onPressed: () {
              final query =
              _searchController.text.trim();

              if (query.isEmpty) {
                _showSearchMessage();
                return;
              }

              _openSearchResults(query);
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              size: 19,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Enter an outfit or style to search.',
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _openSearchResults(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            _HomeSearchResultsScreen(
              query: query,
            ),
      ),
    );
  }

  // ============================================================
  // HERO BANNER
  // ============================================================

  Widget _buildHeroBanner() {
    return Container(
      height: 235,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/onboarding_model.jpg',
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withValues(alpha: 0.72),
                  Colors.black.withValues(alpha: 0.30),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              22,
              20,
              20,
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Spacer(),

                const Text(
                  'New Season\nNew You',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    height: 1.15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 9),

                const SizedBox(
                  width: 180,
                  child: Text(
                    'Discover looks made for your style.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    onPressed: _openExplore,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor:
                      AppColors.primary,
                      elevation: 0,
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize:
                      MainAxisSize.min,
                      children: [
                        Text(
                          'Explore Now',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  Widget _buildCategories() {
    final categories = [
      {
        'title': 'Casual',
        'icon': Icons.checkroom_outlined,
      },
      {
        'title': 'Formal',
        'icon': Icons.business_center_outlined,
      },
      {
        'title': 'Party',
        'icon': Icons.favorite_border_rounded,
      },
      {
        'title': 'Sport',
        'icon': Icons.directions_run_rounded,
      },
    ];

    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: categories.map((category) {
        return GestureDetector(
          onTap: () {
            final title =
            category['title'] as String;

            _openCategory(title);
          },
          child: SizedBox(
            width: 68,
            child: Column(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: AppColors.purpleLight,
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    size: 25,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  category['title'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                    AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight:
                    FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // ============================================================
  // TRENDING LOOKS
  // ============================================================

  Widget _buildTrendingLooks() {
    return SizedBox(
      height: 205,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics:
        const BouncingScrollPhysics(),
        itemCount: _trendingLooks.length,
        separatorBuilder: (_, _) =>
        const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final look =
          _trendingLooks[index];

          return _TrendingLookCard(
            title: look['title']!,
            image: look['image']!,
            onTap: () {
              _openTrendingLook(
                look['title']!,
              );
            },
          );
        },
      ),
    );
  }

  // ============================================================
  // TRY ON CARD
  // ============================================================

  Widget _buildTryOnCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.purpleLight,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.auto_awesome_rounded,
              color: AppColors.primary,
              size: 29,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Try outfits with your photo',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'See how different looks suit you.',
                  style: TextStyle(
                    color:
                    AppColors.textSecondary,
                    fontSize: 11,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: _openTryOn,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION HEADER
  // ============================================================

  Widget _buildSectionHeader({
    required String title,
    required String action,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CIRCLE ICON BUTTON
  // ============================================================

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Icon(
          icon,
          color: AppColors.textPrimary,
          size: 21,
        ),
      ),
    );
  }

  // ============================================================
  // OPEN EXPLORE
  // ============================================================

  void _openExplore() {
    setState(() {
      _selectedNavIndex = 1;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const ExploreScreen(),
      ),
    );
  }

  // ============================================================
  // OPEN CATEGORY
  // ============================================================

  void _openCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            _CategoryLooksScreen(
              category: category,
            ),
      ),
    );
  }

  // ============================================================
  // OPEN TRENDING LOOK
  // ============================================================

  void _openTrendingLook(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            OutfitDetailScreen(
              title: title,
            ),
      ),
    );
  }

  // ============================================================
  // OPEN TRY ON
  // ============================================================

  void _openTryOn() {
    setState(() {
      _selectedNavIndex = 2;
    });

    // ----------------------------------------------------------
    // SHOW AD BEFORE TRY ON
    // ----------------------------------------------------------
    Navigator.pushNamed(
      context,
      '/ad',
    );
  }

  // ============================================================
  // OPEN SAVED
  // ============================================================

  void _openSaved() {
    setState(() {
      _selectedNavIndex = 3;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const SavedScreen(),
      ),
    );
  }

  // ============================================================
  // OPEN PROFILE
  // ============================================================

  void _openProfile() {
    setState(() {
      _selectedNavIndex = 4;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const ProfileScreen(),
      ),
    );
  }

  // ============================================================
  // NOTIFICATION
  // ============================================================

  void _showNotificationMessage() {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'No new notifications',
        ),
        duration:
        Duration(seconds: 2),
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
        border: Border(
          top: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _navItem(
              icon: Icons.home_rounded,
              label: 'Home',
              index: 0,
              onTap: () {
                setState(() {
                  _selectedNavIndex = 0;
                });
              },
            ),
          ),

          Expanded(
            child: _navItem(
              icon: Icons.explore_outlined,
              label: 'Explore',
              index: 1,
              onTap: _openExplore,
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: _openTryOn,
              child: Center(
                child: Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary
                            .withValues(
                          alpha: 0.25,
                        ),
                        blurRadius: 12,
                        offset:
                        const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: _navItem(
              icon:
              Icons.bookmark_border_rounded,
              label: 'Saved',
              index: 3,
              onTap: _openSaved,
            ),
          ),

          Expanded(
            child: _navItem(
              icon:
              Icons.person_outline_rounded,
              label: 'Profile',
              index: 4,
              onTap: _openProfile,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NAVIGATION ITEM
  // ============================================================

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    final bool selected =
        _selectedNavIndex == index;

    return GestureDetector(
      behavior:
      HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: selected
                ? AppColors.primary
                : AppColors.textSecondary,
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: selected
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// TRENDING LOOK CARD
// ================================================================

class _TrendingLookCard
    extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _TrendingLookCard({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 142,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              BorderRadius.circular(17),
              child: SizedBox(
                width: 142,
                height: 165,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              maxLines: 1,
              overflow:
              TextOverflow.ellipsis,
              style: const TextStyle(
                color:
                AppColors.textPrimary,
                fontSize: 12,
                fontWeight:
                FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// CATEGORY LOOKS SCREEN
// ================================================================

class _CategoryLooksScreen
    extends StatelessWidget {
  final String category;

  const _CategoryLooksScreen({
    required this.category,
  });

  List<_HomeLookData>
  _getCategoryLooks() {
    const allLooks = [
      _HomeLookData(
        title: 'Casual Chic',
        category: 'Casual',
        style: 'Casual',
        occasion: 'Everyday',
        season: 'All Season',
        description:
        'A relaxed and stylish everyday look for a comfortable day.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Weekend Look',
        category: 'Casual',
        style: 'Casual',
        occasion: 'Weekend',
        season: 'Spring',
        description:
        'An effortless outfit designed for relaxed weekend plans.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Office Ready',
        category: 'Formal',
        style: 'Formal',
        occasion: 'Office',
        season: 'All Season',
        description:
        'A polished professional look with a modern silhouette.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Modern Classic',
        category: 'Formal',
        style: 'Classic',
        occasion: 'Work',
        season: 'All Season',
        description:
        'Classic pieces styled with a contemporary feel.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Date Night',
        category: 'Party',
        style: 'Party',
        occasion: 'Date Night',
        season: 'All Season',
        description:
        'A stylish and confident look for a special evening.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Party Ready',
        category: 'Party',
        style: 'Party',
        occasion: 'Party',
        season: 'Winter',
        description:
        'A bold look designed for celebrations.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Sporty Fit',
        category: 'Sport',
        style: 'Sport',
        occasion: 'Workout',
        season: 'All Season',
        description:
        'A comfortable active look made for movement and workouts.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
    ];

    return allLooks
        .where(
          (look) =>
      look.category
          .toLowerCase() ==
          category.toLowerCase(),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final looks =
    _getCategoryLooks();

    return Scaffold(
      backgroundColor:
      AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ------------------------------------------------------
            // TOP BAR
            // ------------------------------------------------------

            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                18,
                12,
                18,
                0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const SizedBox(
                      width: 42,
                      height: 42,
                      child: Icon(
                        Icons
                            .arrow_back_ios_new_rounded,
                        size: 19,
                        color:
                        Color(0xFF292633),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      '$category Looks',
                      textAlign:
                      TextAlign.center,
                      style:
                      const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.w700,
                        color:
                        Color(0xFF292633),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 42,
                  ),
                ],
              ),
            ),

            // ------------------------------------------------------
            // CONTENT
            // ------------------------------------------------------

            Expanded(
              child: GridView.builder(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  28,
                ),
                physics:
                const BouncingScrollPhysics(),
                itemCount:
                looks.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.67,
                ),
                itemBuilder:
                    (context, index) {
                  final look =
                  looks[index];

                  return _HomeOutfitCard(
                    look: look,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              OutfitDetailScreen(
                                title:
                                look.title,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// SEARCH RESULTS SCREEN
// ================================================================

class _HomeSearchResultsScreen
    extends StatelessWidget {
  final String query;

  const _HomeSearchResultsScreen({
    required this.query,
  });

  List<_HomeLookData>
  _searchLooks() {
    const allLooks = [
      _HomeLookData(
        title: 'Elegant Style',
        category: 'Formal',
        style: 'Elegant',
        occasion: 'Formal',
        season: 'All Season',
        description:
        'A clean and elegant look suitable for different occasions.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Casual Chic',
        category: 'Casual',
        style: 'Casual',
        occasion: 'Everyday',
        season: 'All Season',
        description:
        'A relaxed and stylish everyday look for a comfortable day.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Weekend Look',
        category: 'Casual',
        style: 'Casual',
        occasion: 'Weekend',
        season: 'Spring',
        description:
        'An effortless outfit designed for relaxed weekend plans.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Date Night',
        category: 'Party',
        style: 'Party',
        occasion: 'Date Night',
        season: 'All Season',
        description:
        'A stylish and confident look for a special evening.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Office Ready',
        category: 'Formal',
        style: 'Formal',
        occasion: 'Office',
        season: 'All Season',
        description:
        'A polished professional look with a modern silhouette.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Sporty Fit',
        category: 'Sport',
        style: 'Sport',
        occasion: 'Workout',
        season: 'All Season',
        description:
        'A comfortable active look made for movement and workouts.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Modern Classic',
        category: 'Formal',
        style: 'Classic',
        occasion: 'Work',
        season: 'All Season',
        description:
        'Classic pieces styled with a contemporary feel.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
      _HomeLookData(
        title: 'Party Ready',
        category: 'Party',
        style: 'Party',
        occasion: 'Party',
        season: 'Winter',
        description:
        'A bold look designed for celebrations.',
        image:
        'assets/images/onboarding_model.jpg',
      ),
    ];

    final search =
    query.trim().toLowerCase();

    if (search.isEmpty) {
      return allLooks;
    }

    return allLooks
        .where(
          (look) {
        return look.title
            .toLowerCase()
            .contains(search) ||
            look.category
                .toLowerCase()
                .contains(search) ||
            look.style
                .toLowerCase()
                .contains(search) ||
            look.occasion
                .toLowerCase()
                .contains(search) ||
            look.season
                .toLowerCase()
                .contains(search);
      },
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final results =
    _searchLooks();

    return Scaffold(
      backgroundColor:
      AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ------------------------------------------------------
            // TOP BAR
            // ------------------------------------------------------

            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                18,
                12,
                18,
                0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const SizedBox(
                      width: 42,
                      height: 42,
                      child: Icon(
                        Icons
                            .arrow_back_ios_new_rounded,
                        size: 19,
                        color:
                        Color(0xFF292633),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      'Search Results',
                      textAlign:
                      TextAlign.center,
                      style:
                      const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.w700,
                        color:
                        Color(0xFF292633),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 42,
                  ),
                ],
              ),
            ),

            // ------------------------------------------------------
            // SEARCH QUERY
            // ------------------------------------------------------

            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                20,
                14,
                20,
                8,
              ),
              child: Align(
                alignment:
                Alignment.centerLeft,
                child: Text(
                  'Results for "$query"',
                  style:
                  const TextStyle(
                    fontSize: 13,
                    color:
                    Color(0xFF777383),
                  ),
                ),
              ),
            ),

            // ------------------------------------------------------
            // RESULTS
            // ------------------------------------------------------

            Expanded(
              child: results.isEmpty
                  ? _buildNoResults()
                  : GridView.builder(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  10,
                  20,
                  28,
                ),
                physics:
                const BouncingScrollPhysics(),
                itemCount:
                results.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio:
                  0.67,
                ),
                itemBuilder:
                    (context, index) {
                  final look =
                  results[index];

                  return _HomeOutfitCard(
                    look: look,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              OutfitDetailScreen(
                                title:
                                look.title,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Padding(
        padding:
        const EdgeInsets.all(30),
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 55,
              color:
              Color(0xFFB0A9C5),
            ),

            const SizedBox(
              height: 12,
            ),

            const Text(
              'No outfits found',
              style:
              TextStyle(
                fontSize: 18,
                fontWeight:
                FontWeight.w700,
                color:
                Color(0xFF292633),
              ),
            ),

            const SizedBox(
              height: 6,
            ),

            Text(
              'No outfit matches "$query".',
              textAlign:
              TextAlign.center,
              style:
              const TextStyle(
                fontSize: 12,
                color:
                Color(0xFF777383),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// HOME OUTFIT CARD
// ================================================================

class _HomeOutfitCard
    extends StatelessWidget {
  final _HomeLookData look;
  final VoidCallback onTap;

  const _HomeOutfitCard({
    required this.look,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
        BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(19),
          border: Border.all(
            color:
            const Color(0xFFE5E1EF),
          ),
        ),
        child: ClipRRect(
          borderRadius:
          BorderRadius.circular(19),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  look.image,
                  width:
                  double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  11,
                  9,
                  11,
                  11,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      look.title,
                      maxLines: 1,
                      overflow:
                      TextOverflow.ellipsis,
                      style:
                      const TextStyle(
                        fontSize: 13,
                        fontWeight:
                        FontWeight.w700,
                        color:
                        Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
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
                            const Color(
                              0xFFEDE8FF,
                            ),
                            borderRadius:
                            BorderRadius
                                .circular(
                              12,
                            ),
                          ),
                          child: Text(
                            look.category,
                            style:
                            const TextStyle(
                              fontSize: 9,
                              fontWeight:
                              FontWeight
                                  .w600,
                              color:
                              Color(
                                0xFF7452E8,
                              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// HOME LOOK DATA
// ================================================================

class _HomeLookData {
  final String title;
  final String category;
  final String style;
  final String occasion;
  final String season;
  final String description;
  final String image;

  const _HomeLookData({
    required this.title,
    required this.category,
    required this.style,
    required this.occasion,
    required this.season,
    required this.description,
    required this.image,
  });
}