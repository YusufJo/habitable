part of '../signup.dart';
class _AlreadyHaveAnAccountRichText extends StatelessWidget {
  const _AlreadyHaveAnAccountRichText({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: responsiveSizer.text(14)),
        children: const [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
              text: 'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
