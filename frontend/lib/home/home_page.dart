import 'package:flutter/material.dart';
import 'package:latwe_ustawy/settings/settings_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Łatwa Ustawa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            icon: Icon(LucideIcons.settings),
          ),
        ],
      ),
      body: Center(child: Text("HomePage")),
    );
  }
}
