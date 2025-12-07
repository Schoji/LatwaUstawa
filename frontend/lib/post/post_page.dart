import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:latwe_ustawy/home/widgets/like_button.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'package:latwe_ustawy/post/widgets/file_widget.dart';
import 'package:latwe_ustawy/post/widgets/legislation_status.dart';
import 'package:latwe_ustawy/post/widgets/tag_badge.dart';

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
      appBar: AppBar(
        title: Text("Szczegóły ustawy"),
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              border: Border.all(color: colors.onSurfaceVariant.withAlpha(20)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      border: Border.all(
                        color: colors.onSurfaceVariant.withAlpha(80),
                        width: 0.2,
                      ),
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

                  LikeButton(likesCount: post.likesCount),
                  if (post.steps.isNotEmpty)
                    LegislationStatus(stages: post.steps),
                  Text(
                    "Dokumenty i źródła",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      FileWidget(fileName: post.justificationPdf),
                      FileWidget(fileName: post.sourceLink),
                    ],
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
