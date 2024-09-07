import 'package:prep_master/values/custom_colors.dart';

import '../headers.dart';

AppBar customAppBar({required String title, bool leading = true}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: TxtStyles.regularInter14(
        CustomColors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    automaticallyImplyLeading: leading,
    elevation: 0,
    centerTitle: true,
    leading: leading ? const BackButton() : null,
  );
}
