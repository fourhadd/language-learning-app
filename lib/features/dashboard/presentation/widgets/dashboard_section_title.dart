import 'package:flutter/material.dart';
import 'package:language_learning_ui/core/constants/constants.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 21.0,
            color: Constants.primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (showViewAll)
          Text(
            "View all",
            style: TextStyle(
              fontSize: 15.0,
              color: Constants.captionTextColor,
            ),
          ),
      ],
    );
  }
}
