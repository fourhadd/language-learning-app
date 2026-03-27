import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/language/cubit/language_cubit.dart';
import 'package:language_learning_ui/features/language/presentation/pages/choose_language_page.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/register_page.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/login_page.dart';
import 'package:language_learning_ui/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/home.dart';
import 'package:language_learning_ui/pages/lesson_screen.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
        BlocProvider<DashboardCubit>(create: (context) => DashboardCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Language Learning App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.rubikTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            initialRoute: isLoggedIn ? "/dashboard" : "/",
            onGenerateRoute: _onGenerateRoute,
          );
        },
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (_) => Home());
    case "/register":
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case "/login":
      return MaterialPageRoute(builder: (_) => LoginPage());
    case "/choose-language":
      return MaterialPageRoute(builder: (_) => ChooseLanguage());
    case "/dashboard":
      return MaterialPageRoute(builder: (_) => Dashboard());
    case "/lesson-screen":
      return MaterialPageRoute(builder: (_) => LessonScreen());
    default:
      return MaterialPageRoute(builder: (_) => RegisterPage());
  }
}
