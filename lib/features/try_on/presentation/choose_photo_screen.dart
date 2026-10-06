import 'package:flutter/material.dart';
import '../../outfit/presentation/choose_outfit_screen.dart';

class ChoosePhotoScreen extends StatelessWidget {
  const ChoosePhotoScreen({super.key});

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
                      'Try On',
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
                      'Choose your photo',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Upload a clear photo of yourself to try on outfits.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF777383),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -------------------------------------------------
                    // PHOTO AREA
                    // -------------------------------------------------
                    Container(
                      width: double.infinity,
                      height: 365,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE8FF),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFFE0DBF0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 94,
                            height: 94,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add_a_photo_outlined,
                              size: 40,
                              color: Color(0xFF7452E8),
                            ),
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Add your photo',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF292633),
                            ),
                          ),

                          const SizedBox(height: 7),

                          const Text(
                            'Use a photo from your gallery\n'
                                'or take a new one.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: Color(0xFF777383),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // -------------------------------------------------
                    // CAMERA + GALLERY
                    // -------------------------------------------------
                    Row(
                      children: [
                        Expanded(
                          child: _PhotoOption(
                            icon: Icons.camera_alt_outlined,
                            title: 'Camera',
                            onTap: () {
                              // Camera functionality will be added later.
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _PhotoOption(
                            icon: Icons.photo_library_outlined,
                            title: 'Gallery',
                            onTap: () {
                              // Gallery functionality will be added later.
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // -------------------------------------------------
                    // CONTINUE
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const ChooseOutfitScreen(),
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
// PHOTO OPTION
// ================================================================

class _PhotoOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _PhotoOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFE5E1EF),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
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