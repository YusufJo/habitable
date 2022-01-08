import 'package:flutter/material.dart';
import 'presentation/ui/onboarding/onboarding.dart';
import 'presentation/shared/responsive/responsive_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (lightTheme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        title: 'Habitable',
        home: const OnboardingScreen(),
      ),
    );
  }
}
