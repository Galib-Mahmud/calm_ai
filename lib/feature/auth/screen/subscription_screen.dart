import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedPlan = 'Monthly';

  void _onPlanSelected(String plan) {
    setState(() {
      selectedPlan = plan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'Subscription',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),

        centerTitle: true,
      ),


      body: Container(

        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),

            // Title
            Text(
              'Get Premium',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF07657E),
                fontFamily: 'Roboto',
              ),
            ),

            SizedBox(height: 8.h),

            // Subtitle
            Text(
              'Unlock access to premium voices and features to make your meditation experience even better!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),

            SizedBox(height: 24.h),

            // Illustration
            Image.asset(
              'assets/images/auth/box.png', // Replace with actual asset path
              height: 100.h,
            ),

            SizedBox(height: 32.h),

            // Monthly Plan
            GestureDetector(
              onTap: () => _onPlanSelected('Monthly'),
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: selectedPlan == 'Monthly' ? Color(0xFFE9F6FF) : Colors.white,
                  border: Border.all(
                    color: selectedPlan == 'Monthly' ? Color(0xFF07657E) : Colors.grey.shade300,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Monthly',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'First 7 days free - Then \$99/Month',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Annual Plan
            GestureDetector(
              onTap: () => _onPlanSelected('Annual'),
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: selectedPlan == 'Annual' ? Color(0xFFE9F6FF) : Colors.white,
                  border: Border.all(
                    color: selectedPlan == 'Annual' ? Color(0xFF07657E) : Colors.grey.shade300,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Annual',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'First 30 days free - Then \$999/Year',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[700],
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'Best Value',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 32.h),

            // CTA Button
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                onPressed: () {
                  // Start trial logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF07657E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  selectedPlan == 'Annual'
                      ? 'Start 30 days free trial'
                      : 'Start 7 days free trial',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Disclaimer
            Text(
              'By placing this order, you agree to the Terms of Service and Privacy Policy. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey[600],
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
