// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  final String iconAsset;

  const IconImage({
    Key? key,
    required this.iconAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image(
      image: AssetImage(iconAsset),
      width: 24,
      height: 24,
    );
  }
}
