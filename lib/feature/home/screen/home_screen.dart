import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedMood = 'Tired';
  String? selectedReason;

  final List<String> moods = [
    'Sadness',
    'Tired',
    'Stressed',
    'Anxiety',
    'Calm',
  ];

  final List<String> reasons = [
    "Didn't sleep well last night",
    "Feeling mentally drained",
    "Physically exhausted",
    "Emotionally tired or stressed",
    "Had a long or busy day",
    "Not sure, just feeling low on energy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
                    Image.asset(
                      "assets/images/home/menu.png",
                      height: 28.h,
                      width: 28.w,
                      color: Color(0xFF07657E),
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
                        CircleAvatar(
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
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
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
                            'Welcome Nusrat,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '"Share your feelings, and let AI gently create a mindfulness journey that brings you peace and balance."',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14.sp,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // First White Card - Mood Check-in Tabs Only
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
                          // Mood Check-in Title
                          Text(
                            'Mood Check-in',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          // Mood Tabs
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: moods.map((mood) {
                              final isSelected = selectedMood == mood;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => selectedMood = mood),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
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
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Second White Card - Question with Radio Options
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question
                          Text(
                            'What\'s making you feel tired today?',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          // Radio Options
                          ...reasons.map((reason) {
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedReason = reason),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: selectedReason == reason
                                              ? Color(0xFF07657E)
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      child: selectedReason == reason
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
                                        reason,
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

                          SizedBox(height: 16.h),

                          // Next Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 64.w,
                              height: 34.h,
                              decoration: BoxDecoration(
                                color: Color(0xFF07657E),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Start Meditation Button (NOT in a card)
                    SizedBox(
                      width: double.infinity,
                      height: 34.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle meditation start
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
