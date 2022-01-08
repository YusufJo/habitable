part of '../login.dart';

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const buttonsText = ['Continue with Google', 'Continue with Facebook'];
    final textBoxWidth =
        _largestTextSize(buttonsText, Theme.of(context).textTheme.button);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialLoginButton(
          text: buttonsText[0],
          svgIconPath: AssetIcons.google,
          textBoxSize: textBoxWidth,
        ),
        SizedBox(height: ResponsiveSizer.of(context).height(8)),
        SocialLoginButton(
          text: buttonsText[1],
          svgIconPath: AssetIcons.facebook,
          textBoxSize: textBoxWidth,
        ),
      ],
    );
  }

  double _largestTextSize(List<String> strings, TextStyle? style,
      [TextDirection textDirection = TextDirection.ltr]) {
    double widestSize = 0;
    for (String str in strings) {
      final textPainter = TextPainter(
          text: TextSpan(text: str, style: style),
          maxLines: 1,
          textDirection: textDirection)
        ..layout(minWidth: 0, maxWidth: double.maxFinite);
      if (textPainter.width > widestSize) widestSize = textPainter.width;
    }
    return widestSize;
  }
}
