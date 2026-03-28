import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/data/models/language_model.dart';
import 'package:language_learning_ui/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:language_learning_ui/features/language/cubit/language_cubit.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';
import 'package:language_learning_ui/features/language/presentation/widgets/language_selector.dart';
import 'package:language_learning_ui/core/common/primary_button.dart';

class ChooseLanguage extends StatefulWidget {
  ChooseLanguage({super.key});

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  int _activeIndex = -1;

  final List<LanguageModel> languages = [
    LanguageModel(
      language: "English",
      imagePath: "assets/images/england.png",
      code: "en",
    ),
    LanguageModel(
      language: "Azərbaycanca",
      imagePath: "assets/images/azerbaijan.png",
      code: "az",
    ),
    LanguageModel(
      language: "Türkçe",
      imagePath: "assets/images/turkey.png",
      code: "tr",
    ),
    LanguageModel(
      language: "Русский",
      imagePath: "assets/images/russia.png",
      code: "ru",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocBuilder<LanguageCubit, LanguageState>(
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
                      lang.chooseLanguage,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 28.0.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor,
                      ),
                    ),
                    SizedBox(height: 35.0.h),
                    ...languages.asMap().entries.map((entry) {
                      int index = entry.key;
                      LanguageModel langItem = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeIndex = index;
                          });
                        },
                        child: LanguageSelector(
                          isActive: _activeIndex == index,
                          language: langItem.language,
                          imagePath: langItem.imagePath,
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20.0.h),
                    AnimatedCrossFade(
                      crossFadeState: _activeIndex == -1
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 450),
                      firstChild: SizedBox(height: 50.0.h),
                      secondChild: PrimaryButton(
                        text: lang.continueBtn,
                        onPressed: () {
                          final selectedCode = languages[_activeIndex].code;
                          context
                              .read<LanguageCubit>()
                              .changeInterfaceLanguage(selectedCode);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()),
                              (route) => false);
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
