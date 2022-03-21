import 'package:flutter/material.dart';

import '../../assets/fonts.dart';

part 'responsive_sizer.dart';

part '_responsive_theme.dart';

class ResponsiveApp extends StatelessWidget {
  final Widget Function(ThemeData lightTheme, ThemeData darkTheme) builder;

  const ResponsiveApp({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) => LayoutBuilder(
        builder: (_, constraints) => ResponsiveSizer._(
          constraints: constraints,
          orientation: orientation,
          child: _ResponsiveTheme(
            builder: (lightTheme, darkTheme) => builder(lightTheme, darkTheme),
          ),
        ),
      ),
    );
  }
}
