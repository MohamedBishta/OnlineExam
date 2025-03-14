import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore/explore_tab.dart';
import 'package:online_exam/presentation/home/tabs/profile/profile_tab.dart';
import 'package:online_exam/presentation/home/tabs/result/result_tab.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/strings_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static const List<Widget> homeTaps = [
    ExploreTab(),
    ResultTab(),
    ProfileTab(),
  ];
  static List<String> title = [
    StringsManager.explore,
    StringsManager.results,
    StringsManager.profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0.w, top: 54.h),
            child: Text(title[selectedIndex],
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorsManager.customBlue)),
          ),
          Expanded(child: homeTaps[selectedIndex]),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: Duration(seconds: 0),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return ColorsManager.primaryColor; // Blue color when pressed
            }

            return null; // Default (no overlay)
          },
        ),
        height: 60.h,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor:  ColorsManager.customBlue.shade100,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined,color: ColorsManager.primaryColor,),
            label: 'Home',
          ),
          NavigationDestination(
            icon: ImageIcon(AssetImage(AssetsManager.result)),
            label: 'Results',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
