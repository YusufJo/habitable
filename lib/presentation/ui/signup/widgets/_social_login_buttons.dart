part of '../signup.dart';

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Row(
      children: [
        const Expanded(
          child: SocialLoginButton(
            svgIconPath: AssetIcons.google,
            text: 'Google',
          ),
        ),
        SizedBox(
          width: responsiveSizer.width(12),
        ),
        const Expanded(
            child: SocialLoginButton(
                text: 'Facebook', svgIconPath: AssetIcons.facebook))
      ],
    );
  }
}
