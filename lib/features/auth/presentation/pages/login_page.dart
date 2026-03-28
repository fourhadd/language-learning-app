import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/login_footer.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/login_form.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/social_logins.dart';
import 'package:language_learning_ui/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
              (route) => false,
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context
                    .read<AuthCubit>()
                    .getLocalizedError(context, state.message)),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.0.h),
                Text(
                  lang.loginTitle,
                  style: TextStyle(
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor),
                ),
                SizedBox(height: 40.0.h),
                SocialLogins(),
                SizedBox(height: 40.0.h),
                LoginForm(
                    email: _emailController, password: _passwordController),
                SizedBox(height: 10.0.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(lang.forgotPassword,
                        style: TextStyle(color: AppColor.primaryColor)),
                  ),
                ),
                SizedBox(height: 20.0.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading)
                      return Center(child: CircularProgressIndicator());
                    return PrimaryButton(
                      text: lang.logIn,
                      onPressed: () {
                        context.read<AuthCubit>().login(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                      },
                    );
                  },
                ),
                SizedBox(height: 30.0.h),
                LoginFooter(),
                SizedBox(height: 20.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
