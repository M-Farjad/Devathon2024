import 'package:flutter/cupertino.dart';

import '../headers.dart';

class CachedImageLoader {
  CachedImageLoader._();
  static getCachedProfileImage(String url) => CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => Indicators.circularProgress,
        errorWidget: (context, url, error) => const Icon(
          CupertinoIcons.person,
          color: CustomColors.black,
        ),
      );
  static getCachedImage(String url, {BoxFit fit = BoxFit.fill}) =>
      CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        placeholder: (context, url) => Indicators.circularProgress,
        errorWidget: (context, url, error) => const Icon(
          CupertinoIcons.photo,
          color: CustomColors.black,
        ),
      );
}
