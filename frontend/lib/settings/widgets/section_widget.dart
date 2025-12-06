import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, this.label, required this.children});

  final String? label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(0),

          child: label != null
              ? Text(
                  label!,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                )
              : null,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: colors.surfaceContainerLow,
            border: Border.all(color: colors.onSurfaceVariant.withAlpha(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i != children.length - 1)
                  Divider(
                    height: 5,
                    thickness: .5,
                    indent: 60,
                    color: colors.onSurfaceVariant.withAlpha(30),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
