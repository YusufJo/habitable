part of '../onboarding.dart';

class _View extends StatelessWidget {
  final String title;
  final String assetPath;

  const _View(
      {Key? key, required this.title, required this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Title(text: title),
        Flexible(child: _Avatar(assetPath: assetPath)),
        const _Subtitle(),
      ],
    );
  }
}
