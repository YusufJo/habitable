part of 'reset_password.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveSizer.width(10)),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: responsiveSizer.height(120),
                  ),
                  const _ForgotYourPasswordText(),
                  SizedBox(
                    height: responsiveSizer.height(39),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsiveSizer.width(72)),
                    child: const _ResetPasswordImage(),
                  ),
                  SizedBox(
                    height: responsiveSizer.height(45),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(responsiveSizer.height(20)),
                      child: Column(
                        children: [
                          const _EnterEmailText(),
                          SizedBox(
                            height: responsiveSizer.height(30),
                          ),
                          const _EmailTextField(),
                          SizedBox(
                            height: responsiveSizer.height(10),
                          ),
                          const SizedBox(
                            width: double.maxFinite,
                            child: _SendResetLinkButton(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveSizer.height(100)),
                  const _RememberPasswordRichText(),
                  SizedBox(
                    height: responsiveSizer.bottomSafePadding(34),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: responsiveSizer.topSafePadding(11),
                ),
                const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: _BackButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
