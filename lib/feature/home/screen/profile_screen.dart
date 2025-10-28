import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  const ProfileScreen({
    super.key,
    this.name = 'Nusrat Jahan',
    this.email = 'nusratjahan@gmail.com',
  });

  String getInitial() {
    if (name.isEmpty) return '';
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      appBar: AppBar(
        backgroundColor: Color(0XFFF6FAFB),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            Row(
              children: [
                // Avatar with initial
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A237E),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      getInitial(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            // Email Section
            //devider
            Container(
              width: double.infinity,
              height: 1.h,
              color: Colors.black.withOpacity(0.18),
            ),

            SizedBox(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 4.h,
                ),
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.black87,
                  size: 24.sp,
                ),
                title: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(fontSize: 12.sp, color: Color(0xFF7E7E7E)),
                ),
              ),
            ),

            //devider
            Container(
              width: double.infinity,
              height: 1.h,
              color: Colors.black.withOpacity(0.18),
            ),
            // Logout Section
            SizedBox(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black87,
                  size: 22,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  // Handle logout
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
