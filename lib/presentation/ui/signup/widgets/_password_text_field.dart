part of '../signup.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconTextField(
      svgIconPath: AssetIcons.password,
      fillColor: Colors.white,
      obscureText: true,
      decoration: InputDecoration(hintText: 'Password'),
      textInputType: TextInputType.visiblePassword,
    );
  }
}
