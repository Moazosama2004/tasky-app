import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.path,
    this.withColorFilter = true,
    this.height,
    this.width,
  });
  final String path;
  final bool withColorFilter;
  final double? height;
  final double? width;

  const CustomSvgPicture.withoutColorFilter({
    super.key,
    required this.path,
    this.height,
    this.width,
  }) : this.withColorFilter = false;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: withColorFilter
          ? ColorFilter.mode(
              Theme.of(context).colorScheme.secondary,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
