import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/auth/presentation/widgets/social_logins.dart';
import 'package:language_learning_ui/widgets/border_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
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
            Navigator.of(context).pushReplacementNamed("/");
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
                children: [
                  const SizedBox(height: 40.0),
                  Text(
                    "Login to Your \nAccount",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Constants.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  SocialLogins(),
                  const SizedBox(height: 40.0),
                  BorderTextField(
                    hintText: "Email",
                    controller: _emailController,
                  ),
                  const SizedBox(height: 15.0),
                  BorderTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: !_isPasswordVisible,
                    prefixIcon:
                        const Icon(Icons.lock_outline, color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
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
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?",
                          style: TextStyle(color: Constants.primaryColor)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/dashboard",
                          (route) => false,
                        );
                      }
                      if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return PrimaryButton(
                        text: "Log In",
                        onPressed: () {
                          context.read<AuthCubit>().login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: Wrap(
                      children: [
                        const Text("Don't have an account? ",
                            style: TextStyle(fontSize: 16.0)),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              "/register",
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
