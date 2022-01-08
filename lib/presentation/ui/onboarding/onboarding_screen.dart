part of 'onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _OnboardingControllerCubit(),
      child: Builder(builder: (context) {
        final controller = context.read<_OnboardingControllerCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 9,
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.changePage,
                      itemCount: controller.numOfPages,
                      itemBuilder: (_, index) {
                        final dataModel = controller.data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: _View(
                            title: dataModel.title,
                            assetPath: dataModel.assetPath,
                          ),
                        );
                      },
                    ),
                  ),
                  const Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.01,
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _Footer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
