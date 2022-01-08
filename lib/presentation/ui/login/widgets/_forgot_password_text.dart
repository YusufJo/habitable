part of '../login.dart';

class _ForgotPasswordText extends StatelessWidget {
  const _ForgotPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Forgot Password?',
      textAlign: TextAlign.center,
      style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: ResponsiveSizer.of(context).text(14),
          fontWeight: FontWeight.w500,
          fontFamily: AssetFonts.manrope),
    );
  }
}