part of 'onboarding.dart';

// TODO: improve responsive sizing
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _animationDuration = Duration(milliseconds: 300);
  static const _curve = Curves.easeInSine;
  late final _OnboardingControllerCubit _controllerCubit;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controllerCubit = _OnboardingControllerCubit(
      numOfPages: _data.length,
      onNext: _onNext,
      onSkip: _onSkip,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controllerCubit.close();
    super.dispose();
  }

  void _onNext() {
    _pageController.nextPage(duration: _animationDuration, curve: _curve);
  }

  void _onSkip() {
    _pageController.animateToPage(_data.length - 1,
        duration: _animationDuration, curve: _curve);
  }

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return BlocProvider.value(
      value: _controllerCubit,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              height: responsiveSizer.deviceHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: responsiveSizer.topSafePadding(80),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: _controllerCubit.changePage,
                      itemCount: _data.length,
                      itemBuilder: (_, index) {
                        final dataModel = _data[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: responsiveSizer.width(32)),
                          child: _View(
                            title: dataModel.title,
                            assetPath: dataModel.assetPath,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: responsiveSizer.height(65),
                  ),
                  SizedBox(
                    height: responsiveSizer.height(100),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveSizer.width(20)),
                      child: const _Footer(),
                    ),
                  ),
                  SizedBox(
                    height: responsiveSizer.bottomSafePadding(100),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
