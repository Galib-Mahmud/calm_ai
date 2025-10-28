import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StartSessionScreen extends StatefulWidget {
  const StartSessionScreen({super.key});

  @override
  State<StartSessionScreen> createState() => _StartSessionScreenState();
}

class _StartSessionScreenState extends State<StartSessionScreen> {
  bool isPlaying = false;
  int currentSeconds = 0;
  int totalSeconds = 15 * 60; // 15 minutes
  Timer? timer;
  int selectedRating = 0;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void toggleTimer() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      // Start Timer
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (currentSeconds < totalSeconds) {
            currentSeconds++;
          } else {
            timer.cancel();
            isPlaying = false;
            _showCompletionDialog(); // Show dialog when session ends
          }
        });
      });
    } else {
      // Pause Timer
      timer?.cancel();
      _showCompletionDialog(); // Show dialog when paused
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Container(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Close button
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey[600],
                          size: 24.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // Title
                    Text(
                      'Congratulations for successfully\ncompleting your session',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF07657E),
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Rate this session text
                    Text(
                      'Rate this session',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Star Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setDialogState(() {
                              selectedRating = index + 1;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Icon(
                              index < selectedRating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Color(0xFF07657E),
                              size: 32.sp,
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 24.h),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle submit rating
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF07657E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home/back.jpg'), // Use your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                        size: 20.sp,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Start Session',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),

              Spacer(),

              // Session 1 Text
              Text(
                'Session 1',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF07657E),
                ),
              ),

              SizedBox(height: 40.h),

              // Circular Timer Button with Outer Frame (Glowing Effect)
              GestureDetector(
                onTap: toggleTimer,
                child: Container(
                  width: 180.w, // Outer frame size
                  height: 180.h, // Outer frame size
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent, // Transparent to show shadow
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF07657E).withOpacity(0.5), // Outer glowing effect
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 140.w, // Inner circle size
                      height: 140.h, // Inner circle size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF07657E), // Inner circle color
                      ),
                      child: Center(
                        child: Text(
                          isPlaying ? 'Pause' : 'Start', // Change the text to match button's state
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Timer Display
              Text(
                '${formatTime(currentSeconds)} / ${formatTime(totalSeconds)}',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),

              Spacer(),

              // Download Button
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 37.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF07657E),
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
