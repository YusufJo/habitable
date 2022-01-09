part of '../reset_password.dart';

class _ForgotYourPasswordText extends StatelessWidget {
  const _ForgotYourPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Text(
      'Forgot your password?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: responsiveSizer.text(24),
        fontFamily: AssetFonts.klasik,
      ),
    );
  }
}
