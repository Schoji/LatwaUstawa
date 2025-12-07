import 'package:flutter/material.dart';

class AttributeWidget extends StatelessWidget {
  const AttributeWidget({
    super.key,
    required this.primary,
    required this.secondary,
  });

  final String primary;
  final String secondary;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(primary, style: TextStyle(color: colors.onSurfaceVariant)),
          Text(secondary, style: TextStyle(color: colors.onSurface)),
        ],
      ),
    );
  }
}
