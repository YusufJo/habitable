part of '../reset_password.dart';

class _RememberPasswordRichText extends StatelessWidget {
  const _RememberPasswordRichText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: responsiveSizer.text(14),
            color: Theme.of(context).colorScheme.primary),
        children: const [
          TextSpan(text: 'Remember password? '),
          TextSpan(
            text: 'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
