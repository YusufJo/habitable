part of 'login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: responsiveSizer.deviceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: responsiveSizer.height(370),
                  child: const _ImageStack()),
              SizedBox(
                height: responsiveSizer.height(35),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveSizer.width(20),
                ),
                child: const _SocialLoginButtons(),
              ),
              SizedBox(
                height: responsiveSizer.height(25),
              ),
              const _LoginWithEmailCard(),
            ],
          ),
        ),
      ),
    );
  }
}
