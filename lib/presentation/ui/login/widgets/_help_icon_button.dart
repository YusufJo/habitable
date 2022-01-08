part of '../login.dart';

class _HelpIconButton extends StatelessWidget {
  const _HelpIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SvgIconButton(
      svgIconPath: AssetIcons.help,
    );
  }
}
