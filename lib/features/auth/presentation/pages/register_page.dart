import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/register_footer.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/register_form.dart';
import 'package:language_learning_ui/features/language/presentation/pages/choose_language_page.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/social_logins.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ChooseLanguage()),
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
                SizedBox(height: 10.0.h),
                Text(
                  lang.createFreeAccount,
                  style: TextStyle(
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor),
                ),
                SizedBox(height: 35.0.h),
                SocialLogins(),
                SizedBox(height: 40.0.h),
                RegisterForm(
                  firstName: _firstNameController,
                  lastName: _lastNameController,
                  email: _emailController,
                  password: _passwordController,
                ),
                SizedBox(height: 30.0.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading)
                      return Center(child: CircularProgressIndicator());
                    return PrimaryButton(
                      text: lang.signUp,
                      onPressed: () {
                        context.read<AuthCubit>().signUp(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                      },
                    );
                  },
                ),
                SizedBox(height: 15.0.h),
                Text(
                  lang.privacyPolicyAgree,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0.sp, color: AppColor.captionTextColor),
                ),
                SizedBox(height: 30.0.h),
                RegisterFooter(),
                SizedBox(height: 20.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
