part of '../signup.dart';

class _NameTextField extends StatelessWidget {
  const _NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconTextField(
      svgIconPath: AssetIcons.user,
      fillColor: Colors.white,
      decoration: InputDecoration(hintText: 'Name'),
      textInputType: TextInputType.name,
    );
  }
}
