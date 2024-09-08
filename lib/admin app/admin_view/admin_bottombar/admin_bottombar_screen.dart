import 'package:flutter/material.dart';
import 'package:school_system/admin%20app/admin_view/admin_profile/admin_profile_screen.dart';
import 'package:school_system/admin%20app/admin_view/menage_bursarie/menage_bursarie_screen.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_images.dart';
import '../admin_dashboard_screen/admin_dashboard_screen.dart';

class AdminBottombarScreen extends StatefulWidget {
  const AdminBottombarScreen({super.key});

  @override
  State<AdminBottombarScreen> createState() => _AdminBottombarScreenState();
}

class _AdminBottombarScreenState extends State<AdminBottombarScreen> {
  int _selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    AdminDashboardScreen(),
    MenageBursarieScreen(),
    AdminProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.dashboardIcon)),
              label: 'Home',
              backgroundColor: AppColors.noColor),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.bursoriesIcon)),
              label: 'Bursaries',
              backgroundColor: AppColors.noColor),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppImages.profileIconbottom)),
            label: 'Profile',
            backgroundColor: AppColors.noColor,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.kPrimary,
        unselectedItemColor: AppColors.kGrey7D1,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.kPrimary,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.kGrey7D1,
        ),
        iconSize: 25,
        onTap: _onItemTapped,
        elevation: 0,
      ),
    );
  }
}
