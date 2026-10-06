import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imagePath;
  final VoidCallback? onTap;
  final bool showFavorite;
  final bool isFavorite;
  final VoidCallback? onFavorite;

  const AppCard({
    super.key,
    required this.title,
    this.subtitle,
    this.imagePath,
    this.onTap,
    this.showFavorite = false,
    this.isFavorite = false,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =====================================================
            // IMAGE
            // =====================================================
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildImage(),

                  // =================================================
                  // FAVORITE BUTTON
                  // =================================================
                  if (showFavorite)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: onFavorite,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: 19,
                            color: isFavorite
                                ? Colors.red
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // =====================================================
            // TEXT
            // =====================================================
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
                      color: AppColors.textPrimary,
                    ),
                  ),

                  if (subtitle != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // IMAGE
  // ============================================================

  Widget _buildImage() {
    if (imagePath == null || imagePath!.isEmpty) {
      return Container(
        color: const Color(0xFFEDEAF5),
        child: const Center(
          child: Icon(
            Icons.image_outlined,
            size: 40,
            color: Color(0xFF9994A5),
          ),
        ),
      );
    }

    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
      errorBuilder: (
          context,
          error,
          stackTrace,
          ) {
        return Container(
          color: const Color(0xFFEDEAF5),
          child: const Center(
            child: Icon(
              Icons.image_outlined,
              size: 40,
              color: Color(0xFF9994A5),
            ),
          ),
        );
      },
    );
  }
}