import 'package:flutter/material.dart';
import 'package:latwe_ustawy/extensions/capitalize.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, dynamic>> statusColor = {
      "DRAFTED": {"color": Colors.blue.shade300, "icon": LucideIcons.archive},
      "ARCHIVED": {"color": Colors.yellow.shade300, "icon": LucideIcons.toilet},
      "REJECTED": {"color": Colors.red.shade400, "icon": LucideIcons.skull},
      "PASSED": {"color": Colors.green.shade300, "icon": LucideIcons.skull},
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
            Icon(
              statusColor[label]!["icon"],
              size: 16,
              color: statusColor[label]!["color"],
            ),
            Text(
              label.toLowerCase().capitalize(),
              style: TextStyle(color: statusColor[label]!["color"]),
            ),
          ],
        ),
      ),
    );
  }
}
