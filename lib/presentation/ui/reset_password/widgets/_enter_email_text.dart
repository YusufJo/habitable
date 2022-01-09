part of '../reset_password.dart';
class _EnterEmailText extends StatelessWidget {
  const _EnterEmailText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Enter your registered email below to receive password reset instruction',
      textAlign: TextAlign.center,
    );
  }
}
