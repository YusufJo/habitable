part of '../onboarding.dart';

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onboardingControllerCubit =
        context.read<_OnboardingControllerCubit>();

    final lastPageIndex = onboardingControllerCubit.numOfPages - 1;
    return BlocBuilder<_OnboardingControllerCubit, int>(
      bloc: onboardingControllerCubit,
      buildWhen: (oldState, newState) =>
          newState == lastPageIndex || oldState == lastPageIndex,
      builder: (context, state) {
        final visibleChild = state == lastPageIndex
            ? const _GetStartedButton()
            : const _Navigator();
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: visibleChild,
        );
      },
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
        style: TextButton.styleFrom(),
        onPressed: () {},
        child: const Text('Get Started'),
      ),
    );
  }
}
