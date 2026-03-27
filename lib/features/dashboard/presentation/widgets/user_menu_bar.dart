import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';

class UserMenuBar extends StatelessWidget {
  const UserMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        String? displayName = "User";

        if (state is AuthSuccess) {
          displayName = state.userName;
        }
        return Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
              radius: 25.0,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 15.0),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Hello,\n",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(152, 156, 173, 1),
                    ),
                  ),
                  TextSpan(
                    text: displayName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Constants.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Constants.primaryTextColor,
              ),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
