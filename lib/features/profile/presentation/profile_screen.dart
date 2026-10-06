import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                      'Profile',
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
                        Icons.settings_outlined,
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
                  20,
                  20,
                  30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------------------------------
                    // PROFILE HEADER
                    // -------------------------------------------------
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: const Color(0xFFE5E1EF),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 82,
                            height: 82,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE8FF),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFDCD5FA),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.person_outline_rounded,
                              size: 42,
                              color: Color(0xFF7452E8),
                            ),
                          ),

                          const SizedBox(height: 13),

                          const Text(
                            'Your Style Profile',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF292633),
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'Manage your preferences and style.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF777383),
                            ),
                          ),

                          const SizedBox(height: 18),

                          // Edit profile
                          SizedBox(
                            height: 42,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                const Color(0xFF7452E8),
                                side: const BorderSide(
                                  color: Color(0xFF7452E8),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // YOUR STYLE
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

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFFE5E1EF),
                        ),
                      ),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _StyleChip(text: 'Elegant'),
                          _StyleChip(text: 'Casual'),
                          _StyleChip(text: 'Minimal'),
                          _StyleChip(text: 'Classic'),
                          _StyleChip(text: 'Trendy'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // PREFERENCES
                    // -------------------------------------------------
                    const Text(
                      'Preferences',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292633),
                      ),
                    ),

                    const SizedBox(height: 12),

                    _ProfileOption(
                      icon: Icons.favorite_border_rounded,
                      title: 'Saved Outfits',
                      subtitle: 'View your favorite outfits',
                      onTap: () {},
                    ),

                    const SizedBox(height: 10),

                    _ProfileOption(
                      icon: Icons.checkroom_outlined,
                      title: 'Style Preferences',
                      subtitle: 'Update your preferred styles',
                      onTap: () {},
                    ),

                    const SizedBox(height: 10),

                    _ProfileOption(
                      icon: Icons.notifications_none_rounded,
                      title: 'Notifications',
                      subtitle: 'Manage your notifications',
                      onTap: () {},
                    ),

                    const SizedBox(height: 10),

                    _ProfileOption(
                      icon: Icons.help_outline_rounded,
                      title: 'Help & Support',
                      subtitle: 'Get help with the app',
                      onTap: () {},
                    ),

                    const SizedBox(height: 24),

                    // -------------------------------------------------
                    // LOG OUT
                    // -------------------------------------------------
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                          const Color(0xFFD94B68),
                          side: const BorderSide(
                            color: Color(0xFFE8B9C4),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Log Out',
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
// PROFILE OPTION
// ================================================================

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileOption({
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
                size: 21,
                color: const Color(0xFF7452E8),
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
              size: 21,
              color: Color(0xFF9A96A5),
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
        horizontal: 13,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE8FF),
        borderRadius: BorderRadius.circular(20),
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