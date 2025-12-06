import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'package:latwe_ustawy/post/widgets/tag_badge.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String fixHtmlList(String html) {
  return html
      .replaceAll(
        '<ul>',
        '<br><br>',
      ) // Usuwamy otwarcie listy (to ono robi wcięcie)
      .replaceAll('</ul>', '') // Usuwamy zamknięcie
      .replaceAll('<li>', '• ') // Zamieniamy punkt listy na kropkę z paszczą
      .replaceAll(
        '</li>',
        '<br><br>',
      ); // Zamieniamy koniec punktu na nową linię (x2 żeby był odstęp)
}

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
          child: Container(
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    spacing: 10,
                    children: post.tags
                        .map((tag) => TagBadge(tag: tag))
                        .toList(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.representativeName),
                              Text(
                                "zaktualizowano ${DateFormat('d MMM yyyy').format(post.submissionDate)}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            post.sourceId,
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Opis",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      HtmlWidget(
                        fixHtmlList(post.aiSummary),

                        textStyle: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),

                  TextButton.icon(
                    onPressed: () {},
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(LucideIcons.heart),
                    label: Text(post.likesCount.toString()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
