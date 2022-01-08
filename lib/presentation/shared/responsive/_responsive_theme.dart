part of 'responsive_app.dart';

class _ResponsiveTheme extends StatelessWidget {
  static const _defaultRadius = 12.0;
  static const _eclipseColor = Color(0xFF573353);
  static const _morningColor = Color(0xFFFDA758);
  static const _backgroundColor = Color(0xFFFFF3E9);

  const _ResponsiveTheme({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(ThemeData lightTheme, ThemeData darkTheme) builder;

  TextTheme _textStyle(
      {required bool isLight, required double Function(double) sizer}) {
    return TextTheme(
      bodyText2: TextStyle(
          fontFamily: AssetFonts.manrope,
          fontSize: sizer(16),
          fontWeight: FontWeight.w500,
          color: isLight ? _eclipseColor : Colors.white,
          letterSpacing: -0.03),
      subtitle1: TextStyle(
          fontFamily: AssetFonts.manrope,
          fontSize: sizer(16),
          fontWeight: FontWeight.bold,
          color: isLight ? _morningColor : Colors.white,
          letterSpacing: -0.03),
      button: TextStyle(
        fontFamily: AssetFonts.manrope,
        fontWeight: FontWeight.bold,
        fontSize: sizer(16),
        color: isLight ? _morningColor : Colors.white,
        letterSpacing: -0.03,
      ),
    );
  }

  ThemeData _light(ResponsiveSizer responsiveSizer) {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _eclipseColor,
        secondary: _morningColor,
      ),
      splashColor: _eclipseColor.withOpacity(0.1),
      scaffoldBackgroundColor: _backgroundColor,
      textTheme: _textStyle(isLight: true, sizer: responsiveSizer.text),
      dividerTheme: DividerThemeData(
        space: 0,
        thickness: responsiveSizer.height(1),
        color: _backgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        fillColor: _backgroundColor,
        filled: true,
        hintStyle: TextStyle(color: _eclipseColor.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(responsiveSizer.radius(_defaultRadius)),
        ),
        contentPadding: EdgeInsets.all(
          responsiveSizer.height(20),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(_morningColor),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(responsiveSizer.radius(_defaultRadius / 2)),
        ),
        checkColor: MaterialStateProperty.all(_eclipseColor),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          visualDensity: VisualDensity.comfortable,
          shape: ButtonStyleButton.allOrNull(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(responsiveSizer.radius(_defaultRadius)),
            ),
          ),
          backgroundColor: ButtonStyleButton.allOrNull(_morningColor),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(
              responsiveSizer.height(20),
            ),
          ),
        ),
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(responsiveSizer.radius(_defaultRadius)),
        ),
        elevation: 0,
        color: Colors.white,
      ),
    );
  }

  ThemeData _dark(ResponsiveSizer responsiveSize) => ThemeData(
      textTheme: _textStyle(isLight: false, sizer: responsiveSize.text));

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return builder(_light(responsiveSizer), _dark(responsiveSizer));
  }
}
