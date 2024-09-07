import '../headers.dart';

class CustomShadows {
  CustomShadows._();
  static List<BoxShadow> shadowsAbove = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 10,
      offset: const Offset(0, 0),
    ),
  ];
  static List<BoxShadow> cardShodows = [
    const BoxShadow(
      color: Color(0x07000000),
      blurRadius: 16,
      offset: Offset(0, 4),
      spreadRadius: -20,
    )
  ];
  static List<BoxShadow> fieldShadows = [
    const BoxShadow(
      color: CustomColors.grey,
      blurRadius: 10,
      offset: Offset(0, 2),
    ),
  ];
}
