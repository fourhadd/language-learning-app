import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/login_page.dart';
import 'package:language_learning_ui/features/language/presentation/pages/choose_language_page.dart';
import 'package:language_learning_ui/features/profile/presentation/widgets/delete_account_dialog.dart';
import 'package:language_learning_ui/features/profile/presentation/widgets/profile_option_tile.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text(lang.profile),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
              SizedBox(height: 15.h),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  String name = "User";
                  if (state is AuthSuccess) {
                    name = state.userName ?? "User";
                  }
                  return Text(
                    name,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryTextColor,
                    ),
                  );
                },
              ),
              SizedBox(height: 35.h),
              ProfileOptionTile(
                icon: Icons.language,
                color: Colors.blue,
                title: lang.chooseLanguage,
                subtitle: lang.appLanguageSettings,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseLanguage()));
                },
              ),
              SizedBox(height: 60.h),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteAccountDialog(),
                  );
                },
                icon: Icon(Icons.delete_outline),
                label: Text(lang.deleteAccount),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(color: Colors.red.shade100),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
