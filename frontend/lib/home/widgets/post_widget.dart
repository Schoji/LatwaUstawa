import 'package:flutter/material.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'package:latwe_ustawy/post/post_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(post.tags.toString(), style: TextStyle()),
                  Text(post.statusNormalized, style: TextStyle()),
                ],
              ),
              Text(
                post.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(post.aiSummary, style: TextStyle()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(LucideIcons.heart)),
                  Text(post.likesCount.toString()),
                ],
              ),
              Divider(),
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
                    child: Text("Zobacz szczegóły"),
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
