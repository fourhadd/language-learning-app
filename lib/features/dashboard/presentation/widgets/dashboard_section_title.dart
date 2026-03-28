import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class DashboardSectionTitle extends StatelessWidget {
  final String title;
  final bool showViewAll;

  const DashboardSectionTitle({
    super.key,
    required this.title,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 21.0.sp,
            color: AppColor.primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (showViewAll)
          Text(
            lang.viewAll,
            style: TextStyle(
              fontSize: 15.0.sp,
              color: AppColor.captionTextColor,
            ),
          ),
      ],
    );
  }
}
