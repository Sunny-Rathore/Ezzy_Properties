import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageZoomPage extends StatelessWidget {
  final String imageUrl;

  const ImageZoomPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: NetworkImage(imageUrl),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
