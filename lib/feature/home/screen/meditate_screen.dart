import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  String selectedBackground = 'No background noise';
  String selectedVoice = 'Female';

  final List<String> backgrounds = [
    'No background noise',
    'Ocean waves',
    'Rain sounds',
    'Forest ambience',
  ];

  final List<String> voices = ['Female', 'Male'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6FAFB),
        automaticallyImplyLeading: false,

        elevation: 0,
        centerTitle: true,
        title: Text(
          'Meditate',
          style: GoogleFonts.dmSerifDisplay(
            color: Color(0xFF07657E),
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // To continue section
            Center(
              child: Column(
                children: [
                  Text(
                    'To continue',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'To continue, share what you need, and AI will create\nyour personalized experience for you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Guided Meditation Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Color(0xFFF6FAFB),
                borderRadius: BorderRadius.circular(12.r),
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
                  // Title with icon
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Color(0xFF07657E).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset("assets/images/home/guided.png"),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Guided Meditation',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Benefits List
                  _buildBenefitItem('Reduces stress and anxiety'),
                  _buildBenefitItem('Improves focus and concentration'),
                  _buildBenefitItem('Enhances self-awareness'),
                  _buildBenefitItem('Promotes emotional health'),
                  _buildBenefitItem('Lengthens attention span'),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Duration Tag
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Guided meditation ( 15 minutes )',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Background Section
            Text(
              'Background',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF07657E),
              ),
            ),

            SizedBox(height: 12.h),

            // Background Dropdown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedBackground,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[700],
                  ),
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  items: backgrounds.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBackground = newValue!;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Select voice Section
            Text(
              'Select voice',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF07657E),
              ),
            ),

            SizedBox(height: 12.h),

            // Voice Dropdown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedVoice,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[700],
                  ),
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  items: voices.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedVoice = newValue!;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 32.h),

            // Start Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.startSeason);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF07657E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.white, size: 14.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
