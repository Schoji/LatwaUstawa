import 'package:flutter/material.dart';
import 'package:latwe_ustawy/settings/widgets/section_button.dart';
import 'package:latwe_ustawy/settings/widgets/section_widget.dart';
import 'package:latwe_ustawy/settings/widgets/settings_fullpage.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(50),
            width: 1,
          ),
        ),
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SectionWidget(
                //label: "Inne",
                children: [
                  SectionButton(
                    label: "Ochrona o danych osobowych",
                    icon: LucideIcons.shield,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => SettingsFullpage(
                            title: "Ochrona o danych osobowych",
                            children: [
                              SectionButton(
                                label: "Wersja aplikacji",
                                icon: LucideIcons.alignVerticalSpaceAround,
                                clickable: false,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SectionButton(
                    label: "O aplikacji",
                    icon: LucideIcons.info,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              SettingsFullpage(title: "O aplikacji"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
