import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/colors_manager.dart';
import 'package:online_exam/presentation/home/tabs/explore/explore_tab.dart';
import 'package:online_exam/presentation/home/tabs/profile/profile_tab.dart';
import 'package:online_exam/presentation/home/tabs/result/result_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  static const List<Widget> homeTaps = [
    ExploreTab(),
    ResultTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeTaps[selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: Duration(seconds: 0),
        // backgroundColor: ColorsManager.primaryColor,
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

        indicatorColor: const Color(0xffCCD7EB),
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: ImageIcon(AssetImage('assets/icons/result_icon.png')),
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
/*
BottomNavigationBarItem customBottomNavigationBarItem({required Widget icon}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: '',
    backgroundColor: ColorsManager.primaryColor,
    activeIcon: Container(
      decoration: const BoxDecoration(
          color: ColorsManager.primaryColor, shape: BoxShape.),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: icon,
      ),
    ),
  );
}
/*BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: ColorsManager.primaryColor,
          //unselectedItemColor: AppColors.whiteColor,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          backgroundColor: ColorsManager.bottomNavBarColor,
          items: [
            customBottomNavigationBarItem(icon: const Icon(Icons.home_filled)),
            customBottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage('assets/icons/result_icon.png'))),
            customBottomNavigationBarItem(icon: const Icon(Icons.person)),
          ]), */*/
