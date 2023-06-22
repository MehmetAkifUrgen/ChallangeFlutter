import 'package:flutter/material.dart';

class AwardSelectionButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final String image_asset;
  const AwardSelectionButton(
      {super.key,
      required this.isSelected,
      required this.onPressed,
      required this.image_asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.asset(
          image_asset,
          width: 48.0,
          height: 48.0,
        ),
      ),
    );
  }
}
