part of '../signup.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconTextField(
      svgIconPath: AssetIcons.email,
      fillColor: Colors.white,
      decoration: InputDecoration(hintText: 'Email'),
      textInputType: TextInputType.emailAddress,
    );
  }
}
