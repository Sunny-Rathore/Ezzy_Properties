import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:property_app/utils/color_utils.dart';
import 'package:property_app/widgets/container_widget.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final bool? isCircle;
  const ImageWidget(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    if (isCircle!) {
      return ClipOval(child: buildImage());
    } else {
      return buildImage();
    }
  }

  CachedNetworkImage buildImage() {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) => ContainerWidget(
        bColor: grey_color,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
