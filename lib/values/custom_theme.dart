import '../headers.dart';

class CustomTheme {
  CustomTheme._();
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
    useMaterial3: true,
    // dividerColor: CustomColors.dividerColor,
    dividerTheme: const DividerThemeData(
      // space: 0,
      // thickness: 1,
      color: CustomColors.dividerColor,
    ),
    scaffoldBackgroundColor: CustomColors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: CustomColors.white,
    ),
    listTileTheme: const ListTileThemeData(
      // tileColor: CustomColors.white,
      // contentPadding: CustomPadding.allPadding16,
      // shape: RoundedRectangleBorder(
      //   borderRadius: CustomRadius.radius8,
      // ),
      tileColor: CustomColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: CustomColors.black),
      titleTextStyle: TxtStyles.regularPoppins16(
        CustomColors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static InputDecoration get fieldTheme => InputDecoration(
        contentPadding: CustomPadding.allPadding12,
        hintStyle: TxtStyles.regularInter14(
          CustomColors.fieldHintColor,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: TxtStyles.regularInter14(
          CustomColors.black,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: CustomColors.fieldColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius8,
          borderSide: const BorderSide(color: CustomColors.fieldColor),
        ),
        border: OutlineInputBorder(
          borderRadius: CustomRadius.radius8,
          // borderSide: const BorderSide(color: CustomColors.fieldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius8,
          borderSide: const BorderSide(color: CustomColors.fieldColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: CustomRadius.radius8,
          borderSide: const BorderSide(color: CustomColors.fieldColor),
        ),
      );
}
