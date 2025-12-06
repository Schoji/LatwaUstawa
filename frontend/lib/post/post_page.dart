import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Szczegóły ustawy")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
              HtmlWidget(post.aiSummary),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(LucideIcons.heart)),
                  Text(post.likesCount.toString()),
                ],
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
