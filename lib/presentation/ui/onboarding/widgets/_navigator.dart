part of '../onboarding.dart';

class _Navigator extends StatelessWidget {
  const _Navigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<_OnboardingControllerCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NavigationButton(
          onPressed: controller.skip,
          text: 'Skip',
        ),
        SeparatedRow(
          children: List.generate(
            controller.numOfPages,
            (index) => BlocBuilder<_OnboardingControllerCubit, int>(
                builder: (_, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _NavigationDot(
                  isActive: index == state,
                ),
              );
            }),
          ),
          separator: const SizedBox(
            width: 7,
          ),
        ),
        _NavigationButton(onPressed: controller.moveNext, text: 'Next')
      ],
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const _NavigationButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(13),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _NavigationDot extends StatelessWidget {
  final bool isActive;

  const _NavigationDot({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = isActive ? 8.5 : 5.5;
    final color =
        isActive ? colorScheme.primary.withOpacity(0.2) : colorScheme.secondary;
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: isActive
          ? CircleAvatar(
              maxRadius: radius - 2,
              backgroundColor: color.withOpacity(1),
            )
          : null,
    );
  }
}
