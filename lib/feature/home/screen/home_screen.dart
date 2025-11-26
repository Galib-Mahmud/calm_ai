import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';
import '../controller/mood_controller.dart';
import '../../splash/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initialize MoodController
   final MoodController moodController = Get.put(MoodController());

  // Drawer controller
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Image.asset(
                        "assets/images/home/menu.png",
                        height: 28.h,
                        width: 28.w,
                        color: Color(0xFF07657E),
                      ),
                    ),
                    Image.asset(
                      'assets/images/home/logo3.png',
                      height: 45.h,
                      width: 45.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF07657E),
                          size: 28.sp,
                        ),
                        SizedBox(width: 12.w),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteName.profile);
                          },
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundColor: Color(0xFF080B6C),
                            child: Text(
                              'N',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Obx(() {
                if (moodController.isLoadingMoods.value) {
                  return Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),

                      // Welcome Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF07657E), Color(0xFF087A92)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Galib Mahmud,',
                              style: GoogleFonts.dmSerifDisplay(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              '"Share your feelings, and let AI gently create a mindfulness journey that brings you peace and balance."',
                              style: GoogleFonts.roboto(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 12.sp,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Mood Check-in Card with Tabs
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Mood Check-in',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                            SizedBox(height: 16.h),

                            // Mood Tabs
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: moodController.moods.map((mood) {
                                  final isSelected = moodController.selectedMood.value == mood;
                                  return GestureDetector(


                                    onTap: () => moodController.setMood(mood),
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8.w),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: isSelected
                                                ? Color(0xFF07657E)
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        mood,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: isSelected
                                              ? Color(0xFF07657E)
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Questions Card
                      if (moodController.isLoadingQuestions.value)
                        Container(
                          padding: EdgeInsets.all(40.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else if (moodController.questions.isNotEmpty)
                        ...moodController.questions.asMap().entries.map((entry) {
                          int index = entry.key;
                          var question = entry.value;

                          return Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Question
                                Text(
                                  '${index + 1}. ${question.question}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 16.h),

                                // Radio Options
                                ...question.options.map((option) {
                                  final isSelected = moodController.answers[index.toString()] == option;

                                  return GestureDetector(
                                    onTap: () => moodController.setAnswer(index, option),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 12.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Colors.blue
                                                  : Colors.transparent,

                                              shape: BoxShape.circle,
                                              border: Border.all(

                                                color: isSelected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                width: 2,
                                              ),
                                            ),
                                            child: isSelected
                                                ? Center(
                                              child: Container(
                                                width: 10.w,
                                                height: 10.h,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF07657E),
                                                ),
                                              ),
                                            )
                                                : null,
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            child: Text(
                                              option,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        }).toList(),

                      // Submit Button (show only when all questions answered)

                      SizedBox(height: 20.h),

                      // Start Meditation Button
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(initialIndex: 1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF07657E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            'Start your today\'s meditation',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),

    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF6FAFB),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 130.h),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              'Progress',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
                color: Color(0XFF07657E),
              ),
            ),
            onTap: () {
              Get.toNamed(RouteName.progressScreen);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              'History',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
                color: Color(0XFF07657E),
              ),
            ),
            onTap: () {
              Get.toNamed(RouteName.history);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
                color: Color(0XFF07657E),
              ),
            ),
            onTap: () {
              Get.toNamed(RouteName.setting);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              'Downloads',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
                color: Color(0XFF07657E),
              ),
            ),
            onTap: () {
              Get.toNamed(RouteName.download);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              'Subscription',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
                color: Color(0XFF07657E),
              ),
            ),
            onTap: () {
              Get.toNamed(RouteName.subscription);
            },
          ),
          SizedBox(height: 5.h),
          ListTile(
            trailing: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto",
                color: Color(0XFF07657E),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}