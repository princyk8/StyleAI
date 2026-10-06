import 'package:flutter/material.dart';

import '../../../services/storage_service.dart';
import '../../outfit/presentation/outfit_detail_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() =>
      _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final StorageService _storageService =
  StorageService();

  List<String> _savedOutfitIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedOutfits();
  }

  Future<void> _loadSavedOutfits() async {
    final savedIds =
    await _storageService.getSavedOutfitIds();

    if (!mounted) {
      return;
    }

    setState(() {
      _savedOutfitIds = savedIds;
      _isLoading = false;
    });
  }

  Future<void> _removeSavedOutfit(
      String outfitId) async {
    await _storageService.removeOutfit(
      outfitId,
    );

    await _loadSavedOutfits();

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
        Text('$outfitId removed from saved'),
        duration:
        const Duration(seconds: 2),
      ),
    );
  }

  String _displayTitle(String id) {
    switch (id) {
      case 'Elegant Style':
        return 'Elegant Style';
      case 'Casual Chic':
        return 'Casual Chic';
      case 'Weekend Look':
        return 'Weekend Look';
      case 'Date Night':
        return 'Date Night';
      case 'Office Ready':
        return 'Office Ready';
      case 'Sporty Fit':
        return 'Sporty Fit';
      case 'Modern Classic':
        return 'Modern Classic';
      case 'Party Ready':
        return 'Party Ready';
      default:
        return id;
    }
  }

  String _getCategory(String title) {
    switch (title) {
      case 'Casual Chic':
      case 'Weekend Look':
        return 'Casual';

      case 'Date Night':
      case 'Party Ready':
        return 'Party';

      case 'Office Ready':
      case 'Elegant Style':
      case 'Modern Classic':
        return 'Formal';

      case 'Sporty Fit':
        return 'Sport';

      default:
        return 'Style';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Column(
          children: [
            // =====================================================
            // TOP BAR
            // =====================================================
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
                          context);
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

                  const Expanded(
                    child: Text(
                      'Saved Looks',
                      textAlign:
                      TextAlign.center,
                      style: TextStyle(
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

            // =====================================================
            // CONTENT
            // =====================================================
            Expanded(
              child: _isLoading
                  ? const Center(
                child:
                CircularProgressIndicator(
                  color:
                  Color(0xFF7452E8),
                ),
              )
                  : _savedOutfitIds.isEmpty
                  ? _buildEmptyState()
                  : GridView.builder(
                padding:
                const EdgeInsets
                    .fromLTRB(
                  20,
                  18,
                  20,
                  28,
                ),
                physics:
                const BouncingScrollPhysics(),
                itemCount:
                _savedOutfitIds
                    .length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                  childAspectRatio:
                  0.67,
                ),
                itemBuilder:
                    (context, index) {
                  final savedId =
                  _savedOutfitIds[
                  index];

                  final title =
                  _displayTitle(
                    savedId,
                  );

                  return _SavedOutfitCard(
                    title: title,
                    category:
                    _getCategory(
                      title,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              OutfitDetailScreen(
                                title:
                                title,
                              ),
                        ),
                      ).then((_) {
                        _loadSavedOutfits();
                      });
                    },
                    onRemove: () {
                      _removeSavedOutfit(
                        savedId,
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

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding:
        const EdgeInsets.all(30),
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color:
                const Color(0xFFEDE8FF),
                borderRadius:
                BorderRadius.circular(
                  24,
                ),
              ),
              child: const Icon(
                Icons
                    .favorite_border_rounded,
                size: 38,
                color:
                Color(0xFF7452E8),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'No saved looks yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.w800,
                color:
                Color(0xFF292633),
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Save your favorite outfits and\n'
                  'they will appear here.',
              textAlign:
              TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
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
// SAVED OUTFIT CARD
// ================================================================

class _SavedOutfitCard
    extends StatelessWidget {
  final String title;
  final String category;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _SavedOutfitCard({
    required this.title,
    required this.category,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
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
              // -----------------------------------------------------
              // IMAGE
              // -----------------------------------------------------
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/onboarding_model.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Category
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration:
                        BoxDecoration(
                          color: Colors.white
                              .withValues(
                            alpha: 0.92,
                          ),
                          borderRadius:
                          BorderRadius
                              .circular(
                            12,
                          ),
                        ),
                        child: Text(
                          category,
                          style:
                          const TextStyle(
                            fontSize: 9,
                            fontWeight:
                            FontWeight.w700,
                            color:
                            Color(
                              0xFF292633,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Remove button
                    Positioned(
                      top: 9,
                      right: 9,
                      child: GestureDetector(
                        behavior:
                        HitTestBehavior
                            .opaque,
                        onTap: onRemove,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration:
                          BoxDecoration(
                            color: Colors
                                .white
                                .withValues(
                              alpha: 0.94,
                            ),
                            shape:
                            BoxShape
                                .circle,
                          ),
                          child: const Icon(
                            Icons
                                .favorite_rounded,
                            size: 18,
                            color:
                            Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // -----------------------------------------------------
              // TEXT
              // -----------------------------------------------------
              Padding(
                padding:
                const EdgeInsets
                    .fromLTRB(
                  11,
                  9,
                  11,
                  11,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow:
                        TextOverflow
                            .ellipsis,
                        style:
                        const TextStyle(
                          fontSize: 13,
                          fontWeight:
                          FontWeight.w700,
                          color:
                          Color(
                            0xFF292633,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 6,
                    ),

                    const Icon(
                      Icons
                          .arrow_forward_ios_rounded,
                      size: 11,
                      color:
                      Color(0xFF777383),
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