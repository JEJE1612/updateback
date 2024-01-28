import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RaterImage extends StatelessWidget {
  const RaterImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: CachedNetworkImageProvider(
        image,
      ),
      radius: 25,
    );
  }
}
