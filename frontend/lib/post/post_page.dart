import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'package:latwe_ustawy/post/widgets/tag_badge.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text("Szczegóły ustawy")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: post.tags.map((tag) => TagBadge(tag: tag)).toList(),
                ),
                Text(
                  post.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post.representativeName),
                            Text(
                              "zaktualizowano ${DateFormat('d MMM yyyy').format(post.submissionDate)}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                HtmlWidget(post.aiSummary),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(LucideIcons.heart)),
                    Text(post.likesCount.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
