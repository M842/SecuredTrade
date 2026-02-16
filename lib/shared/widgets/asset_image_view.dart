import 'package:flutter/material.dart';

class AssetImageView extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Color? color;

  const AssetImageView({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (_, __, ___) =>
        const Icon(Icons.broken_image),
      ),
    );
  }
}
