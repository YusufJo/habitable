part of '../login.dart';

class _SignupText extends StatelessWidget {
  const _SignupText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            fontSize: ResponsiveSizer.of(context).text(14),
            color: Theme.of(context).colorScheme.primary,
            fontFamily: AssetFonts.manrope),
        children: const [
          TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(fontWeight: FontWeight.w500)),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
