import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/data/models/language_model.dart';
import 'package:language_learning_ui/features/language/cubit/language_cubit.dart';
import 'package:language_learning_ui/widgets/language_selector.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  int _activeIndex = -1;

  final List<LanguageModel> languages = [
    LanguageModel(language: "Spanish", imagePath: "assets/images/spain.png"),
    LanguageModel(language: "English", imagePath: "assets/images/england.png"),
    LanguageModel(language: "German", imagePath: "assets/images/germany.png"),
    LanguageModel(language: "Korean", imagePath: "assets/images/korea.png"),
    LanguageModel(language: "Polish", imagePath: "assets/images/poland.png"),
    LanguageModel(language: "Italian", imagePath: "assets/images/italy.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LanguageCubit, LanguageState>(
        listener: (context, state) {
          if (state is LanguageSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              "/dashboard",
              (route) => false,
            );
          }

          if (state is LanguageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30.0.h),
                    Text(
                      "Choose the Language",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 28.0.sp,
                        fontWeight: FontWeight.w600,
                        color: Constants.primaryTextColor,
                      ),
                    ),
                    SizedBox(height: 35.0.h),
                    ...languages.asMap().entries.map((entry) {
                      int index = entry.key;
                      LanguageModel language = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeIndex = index;
                          });
                        },
                        child: LanguageSelector(
                          isActive: _activeIndex == index,
                          language: language.language,
                          imagePath: language.imagePath,
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20.0.h),
                    AnimatedCrossFade(
                      crossFadeState: _activeIndex == -1
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 450),
                      firstChild: Container(
                        height: 50.0.h,
                      ),
                      secondChild: state is LanguageLoading
                          ? const Center(child: CircularProgressIndicator())
                          : PrimaryButton(
                              text: "Continue",
                              onPressed: () {
                                final selectedLang =
                                    languages[_activeIndex].language;
                                context
                                    .read<LanguageCubit>()
                                    .saveLanguage(selectedLang);
                              },
                            ),
                    ),
                    SizedBox(height: 30.0.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
