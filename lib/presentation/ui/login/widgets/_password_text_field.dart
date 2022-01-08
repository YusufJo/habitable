part of '../login.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconTextField(
      decoration: InputDecoration(hintText: 'Password'),
      svgIconPath: AssetIcons.password,
      obscureText: true,
      textInputType: TextInputType.visiblePassword,
    );
  }
}
