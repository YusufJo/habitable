part of '../login.dart';

class _ImageStack extends StatelessWidget {
  const _ImageStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return Stack(
      fit: StackFit.expand,
      children: [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 0.95,
          child: Image.asset(
            AssetImages.loginImage,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.94,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: const [0.1, 0.6],
                colors: [bgColor, bgColor.withOpacity(0)],
              ),
            ),
          ),
        ),
        Positioned(
          top: responsiveSizer.topSafePadding(32),
          right: responsiveSizer.width(20),
          child: const _HelpIconButton(),
        ),
        Positioned.fill(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: responsiveSizer.width(32)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'WELCOME TO MONUMENTAL HABITS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: responsiveSizer.text(32),
                    fontFamily: AssetFonts.klasik),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

