import 'package:flutter/material.dart';
import 'package:latwe_ustawy/settings/widgets/section_button.dart';
import 'package:latwe_ustawy/settings/widgets/section_widget.dart';
import 'package:latwe_ustawy/settings/widgets/settings_fullpage.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
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
                          builder: (context) => SettingsFullpage(
                            title: "O aplikacji",
                            children: [
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: colors.surfaceContainerHigh,
                                      border: Border.all(
                                        color: colors.onSurfaceVariant
                                            .withAlpha(20),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 6,
                                        children: [
                                          Row(
                                            spacing: 20,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                height: 50,
                                                width: 50,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Łatwa Ustawa",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Wersja 1.0",
                                                    style: TextStyle(
                                                      color: colors
                                                          .onSurfaceVariant,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Twórcy:",
                                                  style: TextStyle(
                                                    color:
                                                        colors.onSurfaceVariant,
                                                  ),
                                                ),
                                                Text("VibingCoders"),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rok wydania:",
                                                style: TextStyle(
                                                  color:
                                                      colors.onSurfaceVariant,
                                                ),
                                              ),
                                              Text("2025"),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Text(
                                              "Ta aplikacja obecnie nie pozwala na nic :)",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
