import 'package:flutter/material.dart';
import 'package:latwe_ustawy/settings/widgets/section_widget.dart';

class SettingsFullpage extends StatelessWidget {
  const SettingsFullpage({super.key, required this.title, this.children});

  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SectionWidget(label: "O aplikacji", children: children ?? []),
    );
  }
}
