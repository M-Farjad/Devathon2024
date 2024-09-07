// // ignore_for_file: use_build_context_synchronously

// import 'dart:developer';

// import '../headers.dart';

// class ImageUtils {
//   static Future<CroppedFile?> picknCropMedia({
//     required bool isGallery,
//     // Future<File> Function(File file)? cropImage,
//   }) async {
//     final ImageSource source =
//         isGallery ? ImageSource.gallery : ImageSource.camera;
//     try {
//       final pickedImage = await pickImage(source: source);
//       if (pickedImage == null) return null;
//       final cropedFile = await cropImage(
//         imagePath: pickedImage.path,
//         cropStyle: CropStyle.rectangle,
//       );
//       if (cropedFile == null) return null;
//       return cropedFile;
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }

//   static Future<XFile?> pickImage(
//       {ImageSource source = ImageSource.gallery}) async {
//     return await ImagePicker().pickImage(source: source);
//   }

//   static Future<CroppedFile?> cropImage({
//     // required BuildContext context,
//     required String imagePath,
//     CropStyle cropStyle = CropStyle.rectangle,
//   }) async {
//     return await ImageCropper().cropImage(
//       sourcePath: imagePath,
//       // cropStyle: cropStyle,
//       compressFormat: ImageCompressFormat.jpg,
//       compressQuality: 100,
//       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//     );
//   }
// }
