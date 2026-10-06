import 'package:flutter/material.dart';

import '../../../services/storage_service.dart';

class OutfitDetailScreen extends StatefulWidget {
  final String title;

  const OutfitDetailScreen({
    super.key,
    required this.title,
  });

  @override
  State<OutfitDetailScreen> createState() =>
      _OutfitDetailScreenState();
}

class _OutfitDetailScreenState
    extends State<OutfitDetailScreen> {
  final StorageService _storageService =
  StorageService();

  bool _isSaved = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _checkSavedStatus();
  }

  Future<void> _checkSavedStatus() async {
    final saved =
    await _storageService.isOutfitSaved(
      widget.title,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _isSaved = saved;
    });
  }

  Future<void> _toggleSave() async {
    if (_isSaving) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final newSavedState =
      await _storageService.toggleOutfit(
        widget.title,
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _isSaved = newSavedState;
        _isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newSavedState
                ? '${widget.title} saved successfully'
                : '${widget.title} unsaved successfully',
          ),
          duration:
          const Duration(seconds: 2),
        ),
      );
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to update saved outfit',
          ),
          duration:
          Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final OutfitData outfit =
    _getOutfitData(widget.title);

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
                      Navigator.pop(context);
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
                      'Outfit Details',
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
              child: SingleChildScrollView(
                physics:
                const BouncingScrollPhysics(),
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  10,
                  20,
                  30,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    // =================================================
                    // IMAGE
                    // =================================================
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                        22,
                      ),
                      child: SizedBox(
                        width:
                        double.infinity,
                        height: 400,
                        child: Image.asset(
                          outfit.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 17,
                    ),

                    // =================================================
                    // TITLE
                    // =================================================
                    Text(
                      outfit.title,
                      style:
                      const TextStyle(
                        fontSize: 25,
                        fontWeight:
                        FontWeight.w800,
                        color:
                        Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Text(
                      outfit.description,
                      style:
                      const TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color:
                        Color(0xFF777383),
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    // =================================================
                    // TAGS
                    // =================================================
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _Tag(
                          text: outfit.style,
                        ),
                        _Tag(
                          text:
                          outfit.occasion,
                        ),
                        _Tag(
                          text: outfit.season,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 23,
                    ),

                    // =================================================
                    // STYLE DETAILS
                    // =================================================
                    const Text(
                      'Style Details',
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
                      height: 11,
                    ),

                    Container(
                      width:
                      double.infinity,
                      padding:
                      const EdgeInsets.all(
                        17,
                      ),
                      decoration:
                      BoxDecoration(
                        color:
                        Colors.white,
                        borderRadius:
                        BorderRadius.circular(
                          18,
                        ),
                        border:
                        Border.all(
                          color:
                          const Color(
                            0xFFE5E1EF,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          _DetailRow(
                            title: 'Style',
                            value:
                            outfit.style,
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          _DetailRow(
                            title:
                            'Occasion',
                            value:
                            outfit.occasion,
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          _DetailRow(
                            title:
                            'Season',
                            value:
                            outfit.season,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 22,
                    ),

                    // =================================================
                    // SAVE / UNSAVE
                    // =================================================
                    SizedBox(
                      width:
                      double.infinity,
                      height: 53,
                      child: OutlinedButton(
                        onPressed:
                        _isSaving
                            ? null
                            : _toggleSave,
                        style:
                        OutlinedButton
                            .styleFrom(
                          foregroundColor:
                          const Color(
                            0xFF7452E8,
                          ),
                          side:
                          const BorderSide(
                            color:
                            Color(
                              0xFF7452E8,
                            ),
                          ),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                              17,
                            ),
                          ),
                        ),
                        child:
                        _isSaving
                            ? const SizedBox(
                          width: 20,
                          height: 20,
                          child:
                          CircularProgressIndicator(
                            strokeWidth:
                            2.5,
                            color:
                            Color(
                              0xFF7452E8,
                            ),
                          ),
                        )
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Icon(
                              _isSaved
                                  ? Icons
                                  .favorite_rounded
                                  : Icons
                                  .favorite_border_rounded,
                              size: 19,
                            ),

                            const SizedBox(
                              width: 8,
                            ),

                            Text(
                              _isSaved
                                  ? 'Unsave Outfit'
                                  : 'Save Outfit',
                              style:
                              const TextStyle(
                                fontSize:
                                14,
                                fontWeight:
                                FontWeight
                                    .w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    // =================================================
                    // TRY IT ON
                    // =================================================
                    SizedBox(
                      width:
                      double.infinity,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          // Try-on functionality
                          // can be connected here.
                        },
                        style:
                        ElevatedButton
                            .styleFrom(
                          backgroundColor:
                          const Color(
                            0xFF7452E8,
                          ),
                          foregroundColor:
                          Colors.white,
                          elevation: 0,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                              17,
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Icon(
                              Icons
                                  .auto_awesome_rounded,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Try It On',
                              style:
                              TextStyle(
                                fontSize: 14,
                                fontWeight:
                                FontWeight.w700,
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

  // ================================================================
  // OUTFIT DATA
  // ================================================================

  OutfitData _getOutfitData(
      String outfitTitle) {
    switch (outfitTitle) {
      case 'Casual Chic':
        return const OutfitData(
          title: 'Casual Chic',
          description:
          'A relaxed and stylish everyday look for a comfortable day.',
          style: 'Casual',
          occasion: 'Everyday',
          season: 'All Season',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Weekend Look':
        return const OutfitData(
          title: 'Weekend Look',
          description:
          'An effortless outfit designed for relaxed weekend plans.',
          style: 'Casual',
          occasion: 'Weekend',
          season: 'Spring',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Date Night':
        return const OutfitData(
          title: 'Date Night',
          description:
          'A stylish and confident look for a special evening.',
          style: 'Party',
          occasion: 'Date Night',
          season: 'All Season',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Office Ready':
        return const OutfitData(
          title: 'Office Ready',
          description:
          'A polished professional look with a modern silhouette.',
          style: 'Formal',
          occasion: 'Office',
          season: 'All Season',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Sporty Fit':
        return const OutfitData(
          title: 'Sporty Fit',
          description:
          'A comfortable active look made for movement and workouts.',
          style: 'Sport',
          occasion: 'Workout',
          season: 'All Season',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Modern Classic':
        return const OutfitData(
          title: 'Modern Classic',
          description:
          'Classic pieces styled with a contemporary feel.',
          style: 'Classic',
          occasion: 'Work',
          season: 'All Season',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Party Ready':
        return const OutfitData(
          title: 'Party Ready',
          description:
          'A bold look designed for celebrations.',
          style: 'Party',
          occasion: 'Party',
          season: 'Winter',
          image:
          'assets/images/onboarding_model.jpg',
        );

      case 'Elegant Style':
      default:
        return const OutfitData(
          title: 'Elegant Style',
          description:
          'A clean and elegant look suitable for different occasions.',
          style: 'Elegant',
          occasion: 'Formal',
          season: 'All Season',
          image:
          'assets/images/onboarding_model.jpg',
        );
    }
  }
}

// ================================================================
// OUTFIT DATA MODEL
// ================================================================

class OutfitData {
  final String title;
  final String description;
  final String style;
  final String occasion;
  final String season;
  final String image;

  const OutfitData({
    required this.title,
    required this.description,
    required this.style,
    required this.occasion,
    required this.season,
    required this.image,
  });
}

// ================================================================
// TAG
// ================================================================

class _Tag extends StatelessWidget {
  final String text;

  const _Tag({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration:
      BoxDecoration(
        color:
        const Color(0xFFEDE8FF),
        borderRadius:
        BorderRadius.circular(
          20,
        ),
      ),
      child: Text(
        text,
        style:
        const TextStyle(
          fontSize: 11,
          fontWeight:
          FontWeight.w600,
          color:
          Color(0xFF7452E8),
        ),
      ),
    );
  }
}

// ================================================================
// DETAIL ROW
// ================================================================

class _DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const _DetailRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
          const TextStyle(
            fontSize: 13,
            color:
            Color(0xFF777383),
          ),
        ),
        Text(
          value,
          style:
          const TextStyle(
            fontSize: 13,
            fontWeight:
            FontWeight.w600,
            color:
            Color(0xFF292633),
          ),
        ),
      ],
    );
  }
}