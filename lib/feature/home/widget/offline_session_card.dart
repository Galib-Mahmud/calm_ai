import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfflineSessionCard extends StatelessWidget {
  final int sessionNumber;
  final VoidCallback? onPlay;
  final VoidCallback? onDelete;

  const OfflineSessionCard({
    super.key,
    required this.sessionNumber,
    this.onPlay,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6FAFB),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.45,
            spreadRadius: 0.45,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 14.h),
      child: Row(
        children: [
          // Session Title
          Expanded(
            child: Text(
              'Session $sessionNumber',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          // Play Button
          Container(
            width: 20.sp,
            height: 20.sp,
            decoration: const BoxDecoration(
              color: Color(0xFF098FB4),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 16.sp,
              ),
              onPressed: onPlay ?? () {},
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 12),
          // Delete Button
          Container(
            width: 20.sp,
            height: 20.sp,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.delete,
                color: const Color(0xFFfc0004),
                size: 24,
              ),
              onPressed: onDelete ?? () {},
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
