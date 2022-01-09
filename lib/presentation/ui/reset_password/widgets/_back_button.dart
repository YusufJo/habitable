part of '../reset_password.dart';

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return SvgIconButton(
      svgIconPath: AssetIcons.back,
      radius: responsiveSizer.radius(25),
      iconWidth: responsiveSizer.width(16),
      containerHeight: responsiveSizer.height(44),
    );
  }
}
