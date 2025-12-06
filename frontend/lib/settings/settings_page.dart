import 'package:flutter/material.dart';
import 'package:latwe_ustawy/settings/widgets/section_button.dart';
import 'package:latwe_ustawy/settings/widgets/section_widget.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionWidget(
              label: "Wygląd",
              children: [
                SectionButton(label: "Wygląd", icon: LucideIcons.palette),
              ],
            ),
            SectionWidget(
              label: "Inne",
              children: [
                SectionButton(
                  label: "Ochrona o danych osobowych",
                  icon: LucideIcons.shield,
                ),
                SectionButton(label: "O aplikacji", icon: LucideIcons.info),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
