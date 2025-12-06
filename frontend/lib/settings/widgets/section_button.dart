import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SectionButton extends StatelessWidget {
  const SectionButton({
    super.key,
    required this.label,
    required this.icon,
    this.clickable = true,
    this.action,
  });

  final String label;
  final IconData icon;
  final bool? clickable;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        onTap: clickable == true ? action : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Icon(icon, size: 22, color: colors.onSurfaceVariant),
                  Text(
                    label,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              if (clickable == true)
                Icon(
                  LucideIcons.chevronRight,
                  color: colors.onSurfaceVariant,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
