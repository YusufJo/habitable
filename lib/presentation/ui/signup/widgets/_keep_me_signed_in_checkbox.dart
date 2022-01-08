part of '../signup.dart';
class _KeepMeSignedInCheckBox extends StatefulWidget {

  const _KeepMeSignedInCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<_KeepMeSignedInCheckBox> createState() => _KeepMeSignedInState();
}

class _KeepMeSignedInState extends State<_KeepMeSignedInCheckBox> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return CustomCheckbox(
      width: responsiveSizer.widthOrDefault(20),
      value: isToggled,
      title: const Text('Keep me signed in'),
      onChanged: (_) => setState(() => isToggled = !isToggled),
    );
  }
}
