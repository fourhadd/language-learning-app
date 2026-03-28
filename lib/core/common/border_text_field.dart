import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double borderRadius;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  BorderTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.borderRadius = 8.0,
    this.controller,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(169, 176, 185, 0.42),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(169, 176, 185, 1),
          ),
        ),
      ),
    );
  }
}
