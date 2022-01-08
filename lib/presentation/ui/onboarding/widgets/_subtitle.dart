part of '../onboarding.dart';

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: responsiveSizer.text(17)),
        children: [
          const TextSpan(text: 'WE CAN '),
          TextSpan(
              text: 'HELP YOU ',
              style: TextStyle(color: colorScheme.secondary)),
          const TextSpan(text: 'TO BE A BETTER VERSION OF '),
          TextSpan(
            text: 'YOURSELF.',
            style: TextStyle(color: colorScheme.secondary),
          )
        ],
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}
