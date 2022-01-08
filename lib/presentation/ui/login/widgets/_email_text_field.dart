part of '../login.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconTextField(
      decoration: InputDecoration(hintText: 'Email'),
      svgIconPath: AssetIcons.email,
      textInputType: TextInputType.emailAddress,
    );
  }
}
