part of '../onboarding.dart';

class _OnboardingControllerCubit extends Cubit<int> {
  final int numOfPages;
  final void Function() _onNext;
  final void Function() _onSkip;

  _OnboardingControllerCubit({
    required this.numOfPages,
    required void Function() onNext,
    required void Function() onSkip,
  })  : _onNext = onNext,
        _onSkip = onSkip,
        super(0);

  void next() => _onNext();

  void changePage(int index) => emit(index);

  void skip() => _onSkip();
}
