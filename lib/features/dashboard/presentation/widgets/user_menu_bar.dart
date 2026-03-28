import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/notifications/presentation/pages/notification_page.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class UserMenuBar extends StatelessWidget {
  UserMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        String displayName = "User";

        if (state is AuthSuccess) {
          displayName = state.userName ?? "User";
        }
        return Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
              radius: 25.0.r,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 15.0.w),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${lang.hello}\n",
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      color: AppColor.blueGreyColor,
                    ),
                  ),
                  TextSpan(
                    text: displayName,
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: AppColor.primaryTextColor,
                size: 24.sp,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            )
          ],
        );
      },
    );
  }
}
