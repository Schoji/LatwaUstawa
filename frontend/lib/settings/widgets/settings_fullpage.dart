import 'package:flutter/material.dart';

class SettingsFullpage extends StatelessWidget {
  const SettingsFullpage({super.key, required this.title, this.children});

  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: children ?? [])),
    );
  }
}
