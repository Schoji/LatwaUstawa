import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String getLikeCount(int likeCount) {
  if (likeCount > 1000000) {
    return "${likeCount ~/ 1000000} mln";
  } else if (likeCount > 1000) {
    return "${likeCount ~/ 1000} tyś";
  }
  return likeCount.toString();
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.likesCount});

  final int likesCount;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      icon: Icon(LucideIcons.heart),
      label: Text(getLikeCount(likesCount)),
    );
  }
}
