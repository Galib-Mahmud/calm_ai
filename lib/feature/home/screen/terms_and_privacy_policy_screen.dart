import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndPrivacyPolicyScreen extends StatelessWidget {
  const TermsAndPrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Color(0XFF07657E)),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color(0XFFF6FAFB),
        elevation: 0,
        centerTitle: true,
        forceMaterialTransparency: true,
        title: Text(
          "Terms and privacy policy",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Privacy Policy (Demo)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            // Last Updated
            const Text(
              'Last Updated: October 4, 2025',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your privacy is important to us. This demo Privacy Policy outlines how we provide a secure and personalized experience while keeping your information protected.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Section 1
            const Text(
              '1. Information We Collect',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'We may collect limited personal information such as your name, email address, and any data you share during chats or sign-up. Non-personal data like device type, usage patterns, and preferences may also be collected to improve app performance and user experience.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Section 2
            const Text(
              '2. How We Use Your Information',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'The information collected is used to:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            _buildBulletPoint('Personalize your experience within the app.'),
            _buildBulletPoint('Save your chat history and preferences.'),
            _buildBulletPoint(
              'Improve app performance and develop new features.',
            ),
            _buildBulletPoint(
              'Communicate updates or support messages when necessary.',
            ),
            const SizedBox(height: 24),
            // Section 3
            const Text(
              '3. Data Security',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'We use reasonable administrative and technical safeguards to protect your data from unauthorized access, misuse, or loss. However, no online system can be guaranteed 100% secure.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Section 4
            const Text(
              '4. Data Sharing',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'We do not sell, rent, or trade your personal data. Information may be shared only when required by law or with trusted partners who help operate the app under strict confidentiality agreements.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Section 5
            const Text(
              '5. Your Rights',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'You have the right to access, update, or delete your data. You can also withdraw consent at any time by contacting us.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Section 6
            const Text(
              '6. Contact Us',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'If you have any questions about this Privacy Policy, please contact us at:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'support@example.com',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF098FB4),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

Widget _buildBulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}
