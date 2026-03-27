import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/language/presentation/pages/choose_language_page.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/social_logins.dart';
import 'package:language_learning_ui/widgets/border_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    "Create Your free \nAccount",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Constants.primaryTextColor,
                    ),
                  ),
                  SizedBox(height: 35.0),
                  SocialLogins(),
                  SizedBox(height: 40.0),
                  Form(
                    child: Column(
                      children: [
                        BorderTextField(
                            hintText: "First Name",
                            controller: _firstNameController),
                        SizedBox(height: 15.0),
                        BorderTextField(
                            hintText: "Last Name",
                            controller: _lastNameController),
                        SizedBox(height: 15.0),
                        BorderTextField(
                            hintText: "Your Email",
                            controller: _emailController),
                        SizedBox(height: 15.0),
                        BorderTextField(
                          controller: _passwordController,
                          hintText: "Password",
                          obscureText: !_isPasswordVisible,
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: Constants.primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return PrimaryButton(
                        text: "Sign Up",
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
                  SizedBox(height: 15.0),
                  Text(
                    "By signing up, you agreed with our Services and Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Constants.captionTextColor,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "Already have account?",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(169, 176, 185, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              "/login",
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
