part of '../signup.dart';
class _CreateYourAccountText extends StatelessWidget {
  const _CreateYourAccountText({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final responsiveSizer = ResponsiveSizer.of(context);
    return Text(
      'CREATE YOUR ACCOUNT',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: responsiveSizer.text(24),
        fontFamily: AssetFonts.klasik,
      ),
    );
  }
}
