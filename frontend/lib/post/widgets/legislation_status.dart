import 'package:flutter/material.dart';
import 'package:latwe_ustawy/models/post_model.dart';

class LegislationStatus extends StatelessWidget {
  const LegislationStatus({super.key, required this.stages});

  final List<PostStep> stages;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      spacing: 10, // TWOJE SPACINGI SĄ ŚWIĘTE
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Status prac",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        for (int i = 0; i < stages.length; i++)
          IntrinsicHeight(
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Icon(Icons.circle, color: Colors.green, size: 12),
                    ),

                    if (i != stages.length - 1)
                      Expanded(
                        child: Container(
                          width: 1,
                          color: colors.onSurfaceVariant.withAlpha(100),
                          margin: const EdgeInsets.symmetric(vertical: 2),
                        ),
                      ),
                  ],
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stages[i].label,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          stages[i].description,
                          style: TextStyle(color: colors.onSurfaceVariant),
                        ),
                        Text(
                          "Data wykonania: ${stages[i].date}",
                          style: TextStyle(color: colors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
