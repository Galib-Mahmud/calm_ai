import 'package:clam_ai/feature/auth/screen/question1_screen.dart';
import 'package:clam_ai/feature/auth/screen/question2_screen.dart';
import 'package:clam_ai/feature/auth/screen/question3_screen.dart';
import 'package:clam_ai/feature/auth/screen/question4_screen.dart';
import 'package:clam_ai/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/screen/meditate_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages =  [
    HomeScreen(),
    MeditateScreen(),
    Question3(),
    Question4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF07657E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    iconPath: 'assets/images/home/home.png',
                    label: 'Home',
                    index: 0,
                  ),
                  _buildNavItem(
                    iconPath: 'assets/images/home/meditate.png',
                    label: 'Meditate',
                    index: 1,
                  ),
                  _buildNavItem(
                    iconPath: 'assets/images/home/progress.png',
                    label: 'Progress',
                    index: 2,
                  ),
                  _buildNavItem(
                    iconPath: 'assets/images/home/history.png',
                    label: 'History',
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    final bool isSelected = _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          _currentIndex = index;
        }),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.transparent
                : Colors.black.withOpacity(0.1),
            border: isSelected
                ? Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 2,
            )
                : null,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 28.w,
                height: 28.h,
                color: Colors.white,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}