import 'package:flutter/material.dart';

class ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  });
}

class ProfileMenuSection extends StatelessWidget {
  final String title;
  final List<ProfileMenuItem> items;

  const ProfileMenuSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFEFEF), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),

          // Menu Items List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: Color(0xFFEEEEEE),
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: item.onTap,
                borderRadius: index == items.length - 1
                    ? const BorderRadius.vertical(bottom: Radius.circular(16))
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        size: 22,
                        color: const Color(0xFF374151),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      item.trailing ??
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey[400],
                            size: 20,
                          ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
