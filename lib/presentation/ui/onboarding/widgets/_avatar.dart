part of '../onboarding.dart';

class _Avatar extends StatelessWidget {
  final String assetPath;

  const _Avatar({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.contain,
    );
  }
}
