import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../feature/presentation/bloc/app_level_bloc/app_bloc.dart';
import '../feature/presentation/bloc/app_level_bloc/app_event.dart';
import '../feature/presentation/bloc/app_level_bloc/app_state.dart';
import '../utils/constant/app_colors.dart';
import 'widget_homepage.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final TextEditingController _addNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
      return Scaffold(
        
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if screen size more than a phone.
              if (size.width >= 600)
                //Navigation rail
                Expanded(
                  flex: 1,
                  child: NavigationRail(
                    backgroundColor: mainColorDark,
                    useIndicator: false,
                    destinations: navigationRail,
                    labelType: NavigationRailLabelType.all,
                    selectedLabelTextStyle: const TextStyle(
                      color: buttonColor,
                      fontSize: 12,
                    ),
                    unselectedLabelTextStyle: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 10,
                    ),
                    selectedIndex: state.index,
                    onDestinationSelected: (value) {
                      context
                          .read<ApplicationBloc>()
                          .add(TriggerAppEvent(value));
                    },
                    //
                    leading: Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/dash_icon/logo5.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                    //
                    trailing: Column(
                      children: [
                     
                        Image.asset(
                          "assets/dash_icon/setting1.png",
                          color: buttonColor,
                          fit: BoxFit.contain,
                          width: 18,
                          height: 18,
                        ),
                        const Text(
                          "Setting",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              //Main page
              // Expanded(
              //   flex: 9,
              //   child: buildPage(state.index),
              // ),

              // //leftSide Page
              // state.index == 0
              //     ? SidePage(size: size, addNoteController: _addNoteController)
              //     : Container(),
            ],
          ),
        ),
        bottomNavigationBar: size.width < 600
            ? Container(
                color: Colors.white,
                child: BottomNavigationBar(
                  backgroundColor: mainColor,
                  onTap: (value) {
                    context.read<ApplicationBloc>().add(TriggerAppEvent(value));
                  },
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.index,
                  elevation: 0,
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.grey.shade600,
                  selectedFontSize: 12,
                  unselectedFontSize: 10,
                  items: bottomTab,
                ),
              )
            : null,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _addNoteController.dispose();
  }
}
