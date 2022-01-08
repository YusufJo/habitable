part of '../onboarding.dart';

class _OnboardingControllerCubit extends Cubit<int> {
  final data = List.unmodifiable(const [
    _DataModel(
        title: 'WELCOME TO MONUMENTAL HABITS',
        assetPath: 'assets/images/onboarding1_avatar.png'),
    _DataModel(
        title: 'CREATE NEW HABIT DAILY',
        assetPath: 'assets/images/onboarding2_avatar.png'),
    _DataModel(
        title: 'KEEP TRACK OF YOUR PROGRESS',
        assetPath: 'assets/images/onboarding3_avatar.png'),
    _DataModel(
        title: 'JOIN A SUPPORTIVE COMMUNITY',
        assetPath: 'assets/images/onboarding4_avatar.png'),
  ]);

  final pageController = PageController(initialPage: 0);

  final _animationDuration = const Duration(milliseconds: 300);

  final _curve = Curves.easeInSine;

  _OnboardingControllerCubit() : super(0);

  int get numOfPages => data.length;

  int get lastPageIndex => numOfPages - 1;

  void moveNext() {
    int newPageIndex = state + 1;
    pageController.animateToPage(newPageIndex,
        duration: _animationDuration, curve: _curve);
  }

  void changePage(int index) => emit(index);

  void skip() => pageController.animateToPage(lastPageIndex,
      duration: _animationDuration, curve: _curve);

  @override
  Future<Function> close() async {
    pageController.dispose();
    return super.close;
  }
}
