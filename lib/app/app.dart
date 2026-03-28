import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:language_learning_ui/features/auth/cubit/auth_cubit.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/favorites/cubit/favourites_cubit.dart';
import 'package:language_learning_ui/features/language/cubit/language_cubit.dart';
import 'package:language_learning_ui/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:language_learning_ui/features/auth/presentation/pages/home.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => AuthCubit()..checkStatus()),
        BlocProvider<FavouritesCubit>(
            create: (context) => FavouritesCubit()..loadFavorites()),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
        BlocProvider<DashboardCubit>(create: (context) => DashboardCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, langState) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Language Learning App',
                    locale: langState.selectedLocale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalizations.supportedLocales,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      textTheme: GoogleFonts.rubikTextTheme(
                          Theme.of(context).textTheme),
                    ),
                    home: authState is AuthSuccess
                        ? const Dashboard()
                        : (authState is AuthLoading
                            ? const Scaffold(
                                body:
                                    Center(child: CircularProgressIndicator()))
                            : const Home()),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
