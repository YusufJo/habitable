import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../responsive/responsive_app.dart';

class SvgIconButton extends StatelessWidget {
  final String svgIconPath;
  final double? radius;

  const SvgIconButton({Key? key, required this.svgIconPath, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final computedRadius =
        ResponsiveSizer.of(context).height(radius == null ? 44 : radius! * 2);
    return Container(
      clipBehavior: Clip.antiAlias,
      height: computedRadius,
      width: computedRadius,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: IconButton(
          splashRadius: computedRadius,
          icon: SvgPicture.asset(svgIconPath, width: computedRadius * 0.25,),
          onPressed: () {},
        ),
      ),
    );
  }
}
