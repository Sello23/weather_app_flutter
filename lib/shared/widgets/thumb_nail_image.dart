import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThumbNailImage extends StatelessWidget {
  const ThumbNailImage({
    super.key,
    required this.thumbnailUri,
  });

  final String thumbnailUri;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      thumbnailUri,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Text('Failed to load image');
      },
    );
  }
}
