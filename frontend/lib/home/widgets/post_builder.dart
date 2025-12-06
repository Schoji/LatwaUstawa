import 'package:flutter/material.dart';
import 'package:latwe_ustawy/home/widgets/post_widget.dart';
import 'package:latwe_ustawy/service/backend_service.dart';

class PostBuilder extends StatelessWidget {
  const PostBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final backendService = BackendService();
    return FutureBuilder(
      future: backendService.fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.data == null) {
          return Text("Something is not yes");
        }
        final children = snapshot.data!
            .map((post) => PostWidget(post: post))
            .toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(spacing: 5, children: children),
        );
      },
    );
  }
}
