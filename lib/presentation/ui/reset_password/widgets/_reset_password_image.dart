part of '../reset_password.dart';
class _ResetPasswordImage extends StatelessWidget {
  const _ResetPasswordImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetImages.resetPassword,
      fit: BoxFit.contain,
    );
  }
}
