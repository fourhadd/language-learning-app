import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/register_page.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            lang.dontHaveAccount,
            style: TextStyle(fontSize: 16.0.sp),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
                (route) => false,
              );
            },
            child: Text(
              " ${lang.signUp}",
              style: TextStyle(
                fontSize: 16.0.sp,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
