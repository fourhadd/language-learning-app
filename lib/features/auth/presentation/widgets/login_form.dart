import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/common/border_text_field.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;

  const LoginForm({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Column(
      children: [
        BorderTextField(
          hintText: lang.email,
          controller: widget.email,
        ),
        SizedBox(height: 15.0.h),
        BorderTextField(
          controller: widget.password,
          hintText: lang.password,
          obscureText: !_isPasswordVisible,
          prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
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
