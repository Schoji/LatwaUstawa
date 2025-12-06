import 'package:flutter/material.dart';
import 'package:latwe_ustawy/extensions/capitalize.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColor = {
      "DRAFTED": Colors.blue.shade300,
      "ARCHIVED": Colors.yellow.shade300,
      "REJECTED": Colors.red.shade400,
      "PASSED": Colors.green.shade300,
    };
    return Container(
      // decoration: BoxDecoration(
      //   color: statusColor[label],
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 5,
          children: [
            Icon(LucideIcons.archive, size: 16, color: statusColor[label]),
            Text(
              label.toLowerCase().capitalize(),
              style: TextStyle(color: statusColor[label]),
            ),
          ],
        ),
      ),
    );
  }
}
