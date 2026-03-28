import 'package:flutter/material.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          lang.notifications,
          style: TextStyle(
              color: Color.fromRGBO(38, 50, 98, 1),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: Color.fromRGBO(38, 50, 98, 1)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 80,
              color: Color.fromRGBO(169, 176, 185, 0.5),
            ),
            SizedBox(height: 16),
            Text(
              lang.noNotifications,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(152, 156, 173, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
