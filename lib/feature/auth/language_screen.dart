import 'package:clam_ai/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';
  bool isExpanded = false;

  final List<String> languages = ['English', 'Farsi', 'Norwegian'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 60.h,
            bottom: 24.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Column(
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // Handle skip action
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              // Logo
              Container(
                child: Image.asset(
                  'assets/images/auth/logo1.png',
                  height: 104.h,
                  width: 104.w,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 32),

              // Title
              Row(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    'Select Language',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Serif Display',
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8),

              // Subtitle
              Row(
                children: [
                  Text(
                    'Select your preferable language',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),

              SizedBox(height: 40),

              // Language selector
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.grey[700]),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                selectedLanguage,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ),

                      // Expanded language list
                      if (isExpanded)
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey[200]!,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            children: languages.map((language) {
                              bool isSelected = language == selectedLanguage;
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedLanguage = language;
                                    isExpanded = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.grey[100]
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.grey[400],
                                        size: 20,
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          language,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected
                                                ? Colors.black87
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Next button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
              Get.toNamed(RouteName.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF07657E),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
