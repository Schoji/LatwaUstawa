import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  const SectionButton({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              Icon(icon, size: 22),
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
