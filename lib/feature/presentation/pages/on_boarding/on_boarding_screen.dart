import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/feature/presentation/reusable_widget/custom_container_button.dart';
import '../../../../core/global.dart';
import '../../../../utils/constant/app_constant.dart';
import '../../../../utils/constant/app_colors.dart';
import '../../bloc/on_boarding_bloc/welcome_bloc.dart';
import '../../bloc/on_boarding_bloc/welcome_event.dart';
import '../../bloc/on_boarding_bloc/welcome_state.dart';
import '../../reusable_widget/big_text.dart';
import '../../reusable_widget/small_text.dart';

class OnBoardingSceen extends StatefulWidget {
  const OnBoardingSceen({super.key});

  @override
  State<OnBoardingSceen> createState() => _OnBoardingSceenState();
}

class _OnBoardingSceenState extends State<OnBoardingSceen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              //pageView
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.pages = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                    1,
                    context,
                    "EvaKon Redefining POS System",
                    "You will get chance to use Our POS System and many more things for free",
                    "Next",
                    "assets/logo.jpeg",
                  ),
                  _page(
                    2,
                    context,
                    "Connectivity",
                    "We provide Un-intruptted service ",
                    "Onboarding...",
                    "assets/logo.jpeg",
                  ),
                ],
              ),

              //dots indicator
              // Positioned(
              //   bottom: 75,
              //   child: DotsIndicator(
              //     position: state.pages.toDouble(),
              //     dotsCount: 3,
              //     decorator: DotsDecorator(
              //       color: primaryColor,
              //       activeColor: green,
              //       size: const Size.square(8.0),
              //       activeSize: const Size(14.0, 8.0),
              //       activeShape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //     ),
              //     mainAxisAlignment: MainAxisAlignment.center,
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }

//PageView widget
  Widget _page(int index, BuildContext context, String title, String subTitle,
      String buttonName, String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 345,
            width: 345,
            child: Image.asset(imgPath),
          ),
          BigText(text: title),
          const SizedBox(
            height: 10,
          ),
          SmallText(
            text: subTitle,
            color: primaryColor,
            size: 12,
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButtonC(
            width: double.infinity,
            text: buttonName,
            color: button,
            height: 50,
            onTap: () {
              if (index < 2) {
                //animation
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                Global.storageService
                    .setBool(AppConstant.deviceFirstTime, true);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/sign-in", (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
