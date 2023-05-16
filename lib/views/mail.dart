import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          color: imageColor,
          height: size.height * imageHeight,
        ),
        SizedBox(
          height: heightBetween,
        ),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
