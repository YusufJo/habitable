import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../responsive/responsive_app.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final double? textBoxSize;
  final String svgIconPath;

  const SocialLoginButton(
      {Key? key,
      required this.text,
      required this.svgIconPath,
      this.textBoxSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: responsiveSizer.height(17))),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgIconPath,
            height: responsiveSizer.height(23),
          ),
          SizedBox(
            width: responsiveSizer.width(30),
          ),
          SizedBox(
            width: textBoxSize,
            child: FittedBox(
              child: Text(
                text,
                style: TextStyle(fontSize: responsiveSizer.text(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
