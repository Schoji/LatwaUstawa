import 'package:flutter/material.dart';
import 'package:latwe_ustawy/global/navigation_bar.dart';
import 'package:latwe_ustawy/global/notifiers.dart';
import 'package:latwe_ustawy/home/widgets/post_builder.dart';
import 'package:latwe_ustawy/members/member_builder.dart';
import 'package:latwe_ustawy/settings/settings_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      bottomNavigationBar: MyNavigationBar(),
      body: SingleChildScrollView(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: Notifiers.selectedTab,
            builder: (context, value, child) {
              if (value == 0) {
                return PostBuilder();
              }
              return MemberBuilder();
            },
          ),
        ),
      ),
    );
  }
}
