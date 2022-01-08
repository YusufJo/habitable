part of '../signup.dart';
class _OrSignInWithDivider extends StatelessWidget {
  const _OrSignInWithDivider({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(0.2),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsiveSizer.width(10)),
          child: Text(
            'Or sign in with',
            style: TextStyle(
              height: 1,
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(0.5),
              fontSize: responsiveSizer.text(14),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
