part of 'signup.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: responsiveSizer.deviceHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: responsiveSizer.topSafePadding(48),
              ),
              const _SignupImage(),
              SizedBox(
                height: responsiveSizer.height(21),
              ),
              const _CreateYourAccountText(),
              SizedBox(
                height: responsiveSizer.height(32),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveSizer.width(20)),
                child: Column(
                  children: [
                    const _NameTextField(),
                    SizedBox(
                      height: responsiveSizer.height(8),
                    ),
                    const _EmailTextField(),
                    SizedBox(
                      height: responsiveSizer.height(8),
                    ),
                    const _PasswordTextField()
                  ],
                ),
              ),
              SizedBox(
                height: responsiveSizer.height(20),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveSizer.width(20)),
                child: Column(
                  children: const [
                    _KeepMeSignedInCheckBox(),
                    _EmailMeCheckbox(),
                  ],
                ),
              ),
              SizedBox(
                height: responsiveSizer.height(20),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveSizer.width(20)),
                child: const _CreateAccountButton(),
              ),
              SizedBox(
                height: responsiveSizer.height(20),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveSizer.width(20)),
                child: const _OrSignInWithDivider(),
              ),
              SizedBox(
                height: responsiveSizer.height(20),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveSizer.width(20)),
                child: const _SocialLoginButtons(),
              ),
              SizedBox(
                height: responsiveSizer.height(32),
              ),
              const _AlreadyHaveAnAccountRichText(),
              SizedBox(
                height: responsiveSizer.bottomSafePadding(34),
              )
            ],
          ),
        ),
      ),
    );
  }
}
