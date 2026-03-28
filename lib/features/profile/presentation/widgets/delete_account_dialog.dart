import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/favorites/cubit/favourites_cubit.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      title: Text(
        lang.deleteAccountTitle,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      content: Text(
        lang.deleteAccountDescription,
        style: TextStyle(fontSize: 14.sp),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            lang.cancel,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () async {
            await context.read<FavouritesCubit>().clearAll();
            context.read<DashboardCubit>().resetDashboard();
            if (context.mounted) {
              await context.read<AuthCubit>().deleteAccount();
            }
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: Text(
            lang.confirmDelete,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
