import 'package:flutter/material.dart';

class TagBadge extends StatelessWidget {
  const TagBadge({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        border: Border.all(
          color: colors.onSurfaceVariant.withAlpha(80),
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(tag, style: TextStyle(color: colors.onSurfaceVariant)),
      ),
    );
  }
}
