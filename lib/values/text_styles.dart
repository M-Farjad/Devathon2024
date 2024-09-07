import '../headers.dart';

class TxtStyles {
  TxtStyles._();

  static TextStyle regularInter8(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 8,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularPoppins9(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 9,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularInter10(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0,
          TextDecoration decoration = TextDecoration.none}) =>
      GoogleFonts.inter(
          color: color,
          fontSize: 10,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: decoration,
          decorationColor: color);

  static TextStyle regularPoppins10(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
  static TextStyle regularManrope10(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularInter11(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0,
          bool lineThrough = false}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 11,
        letterSpacing: letterSpacing,
        decoration: lineThrough == true
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: lineThrough == true ? color : null,
        fontWeight: fontWeight,
      );

  static TextStyle regularPoppins11(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0,
          bool lineThrough = false}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 11,
        letterSpacing: letterSpacing,
        decoration: lineThrough == true
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: lineThrough == true ? color : null,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter12(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 12,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularPoppins12(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 12,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularPoppins13(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 13,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
  static TextStyle regularInter13(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 13,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularPoppins14(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularMonteAlt28(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.montserratAlternates(
        color: color,
        fontSize: 28,
        fontWeight: fontWeight,
      );

  static TextStyle regularMonteAlt16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.montserratAlternates(
        color: color,
        fontSize: 16.3,
        fontWeight: fontWeight,
      );

  static TextStyle regularPoppins16(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularInter18(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
        color: color,
        letterSpacing: letterSpacing,
        fontSize: 18,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter20(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 20,
        letterSpacing: 0.30,
        fontWeight: fontWeight,
      );
  static TextStyle regularManrope20(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: 20,
        letterSpacing: 0.30,
        fontWeight: fontWeight,
      );

  static TextStyle regularPoppins22(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: 22,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );
  static TextStyle regularInter24(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 24,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter25(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 25,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter30(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 30,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularInter34(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 34,
        fontWeight: fontWeight,
        letterSpacing: 0.37,
      );

  static TextStyle regularInter40(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 40,
        fontWeight: fontWeight,
        letterSpacing: 0.3,
      );

  static TextStyle regularInter14(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    bool decoration = false,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration ? TextDecoration.underline : null,
        decorationColor: color,
      );
  static TextStyle regularManrope14(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    bool decoration = false,
  }) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration ? TextDecoration.underline : null,
        decorationColor: color,
      );

  static TextStyle regularInter16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      );
  static TextStyle regularManrope16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      );
  static TextStyle regularManrope(Color color, double fontsize,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      );
  static TextStyle regularManrope18(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: 18,
        fontWeight: fontWeight,
      );
  static TextStyle regularManrope24(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    letterSpacing = 0,
  }) =>
      GoogleFonts.manrope(
        color: color,
        fontSize: 24,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularInter15(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0.30,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: 15,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
}
