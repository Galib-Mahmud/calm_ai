import 'package:clam_ai/feature/home/widget/past_session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF6FAFB),
      appBar: AppBar(
        backgroundColor: Color(0XFFF6FAFB),
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "History",
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
      body: Column(
        children: [
          //Text
          SizedBox(height: 18.h),
          const Text(
            'Your past sessions',
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              color: Color(0xFF2B2B2B),
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 02.h),
          //Mode
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                PastSessionCard(
                  date: '21 Oct',
                  mood: '😴',
                  moodLabel: 'Tired',
                  intensity: '5/10',
                  rating: 3,
                  ratingLabel: 'Average',
                ),
                PastSessionCard(
                  date: '20 Oct',
                  mood: '😓',
                  moodLabel: 'Stressed',
                  intensity: '9/10',
                  rating: 5,
                  ratingLabel: 'Excellent',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
