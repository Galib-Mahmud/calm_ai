import 'package:clam_ai/feature/home/widget/offline_session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF6FAFB),
      appBar: AppBar(
        backgroundColor: Color(0XFFF6FAFB),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Downloads",
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
          const Text(
            'Your past sessions',
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              color: Color(0xFF2B2B2B),
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 21.h),

          Expanded(
            child: ListView(
              children: [
                OfflineSessionCard(
                  sessionNumber: 1,
                  onPlay: null,
                  onDelete: null,
                ),
                OfflineSessionCard(
                  sessionNumber: 2,
                  onPlay: null,
                  onDelete: null,
                ),
                OfflineSessionCard(
                  sessionNumber: 3,
                  onPlay: null,
                  onDelete: null,
                ),
                OfflineSessionCard(
                  sessionNumber: 4,
                  onPlay: null,
                  onDelete: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
