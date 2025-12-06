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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.onSurfaceVariant.withAlpha(20)),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHigh,
                    border: Border.all(
                      color: colors.onSurfaceVariant.withAlpha(80),
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      post.tags[0].toString(),
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  ),
                ),
                Text(post.statusNormalized, style: TextStyle()),
              ],
            ),
            Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              "${post.aiSummary.split(".")[0]}.",
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
            Text(
              post.representativeName,
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: Icon(LucideIcons.heart),
                  label: Text(post.likesCount.toString()),
                ),
                TextButton(
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
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
    );
  }
}
