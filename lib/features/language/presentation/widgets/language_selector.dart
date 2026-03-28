import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';

class LanguageSelector extends StatelessWidget {
  final bool isActive;
  final String language;
  final String imagePath;

  const LanguageSelector({
    super.key,
    required this.isActive,
    required this.language,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      width: double.infinity,
      height: 80.0.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(
          color: isActive ? AppColor.primaryColor : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.softShadowColor,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0.r),
            child: Image.asset(
              imagePath,
              width: 48.0.w,
              height: 32.0.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.flag, size: 30.sp, color: Colors.grey),
            ),
          ),
          SizedBox(width: 15.0.w),
          Text(
            language,
            style: TextStyle(
              fontSize: 18.0.sp,
              color: Color.fromRGBO(34, 40, 60, 1),
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Spacer(),
          if (isActive)
            Icon(
              Icons.check_circle,
              color: AppColor.primaryColor,
              size: 24.sp,
            ),
        ],
      ),
    );
  }
}
