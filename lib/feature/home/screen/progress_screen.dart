import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      appBar: AppBar(
        backgroundColor: Color(0XFFF6FAFB),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Text(
          "Progress",
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 24,
            color: Color(0XFF07657E),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 43.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text
            SizedBox(height: 17.h),
            const Text(
              'Average mood before session',
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Roboto",
                color: Color(0xFF2B2B2B),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),

            // Mood Bar Chart Card
            SizedBox(height: 19.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 11.h),
              decoration: BoxDecoration(
                color: Color(0xFFf5f9fa),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 4.45,
                    spreadRadius: 0.45,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Bar Chart
                  SizedBox(
                    height: 205.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildMoodBar('Sadness', 0.4, Color(0xFF6B8DB8)),
                        _buildMoodBar('Tired', 0.75, Color(0xFFB0A89F)),
                        _buildMoodBar('Stressed', 0.5, Color(0xFFD19B8F)),
                        _buildMoodBar('Anxiety', 0.35, Color(0xFFB4A8C4)),
                        _buildMoodBar('Calm', 0.85, Color(0xFF8ABFB4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            const Text(
              'Average mood after session',
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Roboto",
                color: Color(0xFF2B2B2B),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            //Text
            SizedBox(height: 19.h),
            // Average Mood After Session Card
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: Color(0xFFf5f9fa),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 4.45,
                    spreadRadius: 0.45,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRatingBar('Excellent', 0.85, 'Excellent'),
                  _buildRatingBar('Good', 0.7, 'Good'),
                  _buildRatingBar('Average', 0.45, 'Average'),
                  _buildRatingBar('Bad', 0.2, 'Bad'),
                  _buildRatingBar('Worst', 0.05, 'Worst'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMoodBar(String label, double heightFactor, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 16.w,
            height: 205.h * heightFactor,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
          ),
          Positioned(
            right: -22,
            left: -22,
            bottom: 0,
            child: Container(width: 1, height: 1, color: Colors.grey[400]),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontFamily: "Roboto",
          color: Color(0xFF2B2B2B),
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

Widget _buildRatingBar(String leftLabel, double progress, String rightLabel) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.w),
    child: Row(
      children: [
        SizedBox(
          width: 70.w,
          child: Text(
            leftLabel,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "Roboto",
              color: Color(0xFF2B2B2B),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background bar
              Container(
                height: 12.h,
                decoration: BoxDecoration(
                  color: Color(0xFFc8dde3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
              ),
              // Progress bar
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF07647d),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -15.h,
                left: 0,
                bottom: -15.h,
                child: Container(width: 1, color: Colors.grey[400]),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 70.w,
          child: Text(
            rightLabel,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "Roboto",
              color: Color(0xFF2B2B2B),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
