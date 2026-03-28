import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.only(bottom: 12.0.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0.r),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.0.w),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 22.0.sp),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.0.sp,
            color: Colors.grey,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14.0.sp,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
