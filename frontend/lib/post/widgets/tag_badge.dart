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
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(padding: const EdgeInsets.all(8.0), child: Text(tag)),
    );
  }
}
