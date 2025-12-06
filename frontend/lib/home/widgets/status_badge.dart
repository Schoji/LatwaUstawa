import 'package:flutter/material.dart';
import 'package:latwe_ustawy/extensions/capitalize.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColor = {
      "DRAFTED": Colors.yellow.withAlpha(50),
      "ARCHIVED": Colors.blue.withAlpha(50),
      "REJECTED": Colors.red.withAlpha(50),
      "PASSED": Colors.green.withAlpha(50),
    };
    return Container(
      decoration: BoxDecoration(
        color: statusColor[label],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label.toLowerCase().capitalize()),
      ),
    );
  }
}
