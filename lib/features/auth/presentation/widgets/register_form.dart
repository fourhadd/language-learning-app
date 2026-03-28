import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/common/border_text_field.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController password;

  const RegisterForm({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Column(
      children: [
        BorderTextField(hintText: lang.firstName, controller: widget.firstName),
        SizedBox(height: 15.0.h),
        BorderTextField(hintText: lang.lastName, controller: widget.lastName),
        SizedBox(height: 15.0.h),
        BorderTextField(hintText: lang.yourEmail, controller: widget.email),
        SizedBox(height: 15.0.h),
        BorderTextField(
          controller: widget.password,
          hintText: lang.password,
          obscureText: !_isPasswordVisible,
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColor.primaryColor,
            ),
            onPressed: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
          ),
        ),
      ],
    );
  }
}
