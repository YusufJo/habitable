part of '../login.dart';

class _LoginWithEmailCard extends StatelessWidget {
  const _LoginWithEmailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Card(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(responsiveSizer.radius(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: responsiveSizer.height(16),
          ),
          const Text(
            'Log in with email',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: responsiveSizer.height(16),
          ),
          const Divider(),
          SizedBox(
            height: responsiveSizer.height(16),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveSizer.width(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _EmailTextField(),
                SizedBox(
                  height: responsiveSizer.height(8),
                ),
                const _PasswordTextField(),
                SizedBox(
                  height: responsiveSizer.height(20),
                ),
                const _LoginButton(),
                SizedBox(
                  height: responsiveSizer.height(13),
                ),
                const _ForgotPasswordText(),
                SizedBox(
                  height: responsiveSizer.height(6),
                ),
                const _SignupText(),
                SizedBox(
                  height: responsiveSizer.bottomSafePadding(16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
