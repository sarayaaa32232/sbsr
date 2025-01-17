import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr/Core/Base/BaseState.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/UI/HomeScreen/HomeNavigator.dart';
import 'package:sbsr/UI/HomeScreen/HomeViewModel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'Home-View';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView , HomeViewModel> implements HomeNavigator {
  @override
  Widget build(BuildContext context) {
      super.build(context);
      return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(
            builder: (context, value, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: viewModel!.tabsList[viewModel!.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: value.currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                      label: "Map",
                      icon: Icon(EvaIcons.pin_outline, size: 30,),
                      activeIcon: Icon(EvaIcons.pin, size: 30,)
                    ),
                    BottomNavigationBarItem(
                        label: "Bus Trips",
                        icon: Icon(Bootstrap.list , size: 30,),
                        activeIcon: Icon(Bootstrap.list , size: 30,)
                    )
                    ,BottomNavigationBarItem(
                        label: "History",
                        icon: Icon(Icons.watch_later_outlined , size: 30,),
                        activeIcon: Icon(Icons.watch_later, size: 30,)
                    )
                    ,BottomNavigationBarItem(
                        label: "Profile",
                        icon: Icon(Iconsax.profile_circle_outline , size: 30,),
                        activeIcon: Icon(Iconsax.profile_circle_bold , size: 30,)
                    ),
                  ],
                  onTap: (value){
                    viewModel!.changeSelectedIndex(value);
                  },
                ),
            ),
        ),
      );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
