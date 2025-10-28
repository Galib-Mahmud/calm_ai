import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_name.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Color(0XFF07657E)),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color(0XFFF6FAFB),
        elevation: 0,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "Settings",
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
          //Profile
          ListTile(
            onTap: () {
              Get.toNamed(RouteName.profile);
            },
            leading: Text(
              "Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0Xff2B2B2B),
              ),
            ),
            trailing: Transform.rotate(
              angle: 3.14159, // 180 degrees in radians (π)
              child: Icon(Icons.arrow_back_ios_new_outlined, size: 17.sp),
            ),
          ),

          //Terms and privacy policy
          ListTile(
            onTap: () {
              Get.toNamed(RouteName.termsAndPrivacyPolicyScreen);
            },
            leading: Text(
              "Terms and privacy policy",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0Xff2B2B2B),
              ),
            ),
            trailing: Transform.rotate(
              angle: 3.14159, // 180 degrees in radians (π)
              child: Icon(Icons.arrow_back_ios_new_outlined, size: 17.sp),
            ),
          ),

          //Notification
          ListTile(
            leading: Text(
              "Notification",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0Xff2B2B2B),
              ),
            ),
            trailing: CustomYellowSwitch(
                value: isNotification,
                onChanged:(value){
                  setState(() {
                    isNotification =!isNotification;
                  });
                } ),

          ),
        ],
      ),
    );
  }
}

//custome switch
class CustomYellowSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const CustomYellowSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 31.72.w,
        height: 16.42.h,
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: value ? Color(0xFF07657E) : Colors.grey,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 10.45.w,
            height: 10.45.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
