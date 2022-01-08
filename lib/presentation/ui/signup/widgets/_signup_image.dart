part of '../signup.dart';
class _SignupImage extends StatelessWidget {
  const _SignupImage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Image.asset(
      AssetImages.signupImage,
      height: responsiveSizer.height(200),
    );
  }
}
