import 'package:flutter/material.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'package:latwe_ustawy/post/post_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.onSurfaceVariant.withAlpha(20)),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.tags[0].toString(),
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                  Text(post.statusNormalized, style: TextStyle()),
                ],
              ),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: -1,
                ),
              ),
              Text("${post.aiSummary.split(".")[0]}.", style: TextStyle()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(LucideIcons.heart),
                  ),
                  Text(post.likesCount.toString()),
                ],
              ),
              Divider(
                color: colors.onSurfaceVariant,
                height: 10,
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(post.representativeName),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => PostPage(post: post),
                        ),
                      );
                    },
                    child: Row(
                      spacing: 5,
                      children: [
                        Text("Zobacz szczegóły"),
                        Icon(LucideIcons.chevronRight, size: 18),
                      ],
                    ),
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
