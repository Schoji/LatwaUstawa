import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchURL(String objectUrl) async {
  final Uri url = Uri.parse(objectUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class FileWidget extends StatelessWidget {
  const FileWidget({super.key, required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () async {
        await _launchURL(fileName);
      },
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: colors.surfaceContainerHigh,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LucideIcons.fileArchive, color: colors.onSurfaceVariant),
                  Column(
                    children: [
                      Text(fileName.split("/")[fileName.split("/").length - 1]),
                    ],
                  ),
                ],
              ),
              Icon(LucideIcons.chevronRight, color: colors.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
