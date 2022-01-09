part of '../reset_password.dart';
class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return TextField(
      scrollPadding: EdgeInsets.only(
        top: responsiveSizer.topSafePadding(50),
        bottom: responsiveSizer.bottomSafePadding(50),
      ),
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }
}
