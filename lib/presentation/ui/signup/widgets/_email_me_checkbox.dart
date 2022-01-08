part of '../signup.dart';
class _EmailMeCheckbox extends StatefulWidget {

  const _EmailMeCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  State<_EmailMeCheckbox> createState() => _EmailMeCheckboxState();
}

class _EmailMeCheckboxState extends State<_EmailMeCheckbox> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return CustomCheckbox(
      width: responsiveSizer.widthOrDefault(20),
      value: isToggled,
      title: const Text('Email me about special pricing and more'),
      onChanged: (_) => setState(() => isToggled = !isToggled),
    );
  }
}
