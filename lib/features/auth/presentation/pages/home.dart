import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/login_page.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/register_page.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0.h),
                child: Image.asset("assets/images/home.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Text(
                  lang.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryTextColor,
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              Text(
                lang.welcomeSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0.sp,
                  color: AppColor.captionTextColor,
                ),
              ),
              SizedBox(height: 25.0.h),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.shadowColor,
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      lang.signIn,
                      style: GoogleFonts.roboto(
                        color: AppColor.greyShadowColor,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),
              PrimaryButton(
                text: lang.createAccount,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return RegisterPage();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 30.0.h),
            ],
          ),
        ),
      ),
    );
  }
}
