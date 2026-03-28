import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/login_page.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            lang.alreadyHaveAccount,
            style: TextStyle(fontSize: 16.0.sp, color: AppColor.greyColor),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
            child: Text(
              lang.logIn,
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
