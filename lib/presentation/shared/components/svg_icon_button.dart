import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../responsive/responsive_app.dart';

class SvgIconButton extends StatelessWidget {
  final String svgIconPath;
  final double? radius;
  final double? iconWidth;
  final double? containerHeight;

  const SvgIconButton({
    Key? key,
    required this.svgIconPath,
    this.radius,
    this.iconWidth,
    this.containerHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final computedHeight =
        ResponsiveSizer.of(context).height(radius == null ? 44 : radius! * 2);
    return Container(
      clipBehavior: Clip.antiAlias,
      height: containerHeight ?? computedHeight,
      width: containerHeight ?? containerHeight,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: IconButton(
          splashRadius: computedHeight,
          icon: SvgPicture.asset(
            svgIconPath,
            width: iconWidth ?? computedHeight * 0.25,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
