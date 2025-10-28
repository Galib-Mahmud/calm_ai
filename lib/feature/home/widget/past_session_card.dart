import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class PastSessionCard extends StatelessWidget {
  final String date;
  final String mood;
  final String moodLabel;
  final String intensity;
  final int rating;
  final String ratingLabel;

  const PastSessionCard({
    super.key,
    required this.date,
    required this.mood,
    required this.moodLabel,
    required this.intensity,
    required this.rating,
    required this.ratingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFF6FAFB),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.45,
            spreadRadius: 0.45,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      padding: EdgeInsets.only(top: 12.h, right: 17.w),
      child: Column(
        children: [
          //date
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0Xff2B2B2B),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              // Left section - Mood
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Mood before',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Roboto",
                        color: Color(0xFF2B2B2B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(mood, style: TextStyle(fontSize: 36.sp)),
                    SizedBox(height: 8.h),
                    Text(
                      moodLabel,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Intensity - $intensity',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        color: Color(0XFF2B2B2B).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              // Divider
              Container(width: 2, height: 140.h, color: Colors.grey[400]),
              // Right section - Rating
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Session Rating',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: index < rating
                                ? Color(0xFF098FB4)
                                : Color(0xff07657E),
                            size: 20.sp,
                          );
                        }),
                      ),

                      CustomPaint(
                        size: const Size(80, 80),
                        painter: SemiCircleProgressPainter(
                          progress: rating / 5,
                          color: Color(0xFF098FB4),
                          backgroundColor: Color(0xFFc7e5ed),
                        ),
                        child: SizedBox(
                          width: 80.w,
                          height: 80.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.h),
                              Text(
                                '$rating/5',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                ratingLabel,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFF07657E),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SemiCircleProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color backgroundColor;

  SemiCircleProgressPainter({
    required this.progress,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 + 10);
    final radius = size.width / 2.2;
    const strokeWidth = 13.0;

    // Draw background semi-circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Start from left (π radians)
      math.pi, // Draw π radians (semicircle)
      false,
      backgroundPaint,
    );

    // Draw progress semi-circle
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Start from left
      math.pi * progress, // Draw based on progress
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
