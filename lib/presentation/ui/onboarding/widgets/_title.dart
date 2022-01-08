part of '../onboarding.dart';

class _Title extends StatelessWidget {
  final String text;

  const _Title({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Text(
      text,
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: responsiveSizer.text(32),
        fontFamily: AssetFonts.klasik,
      ),
    );
  }
}
