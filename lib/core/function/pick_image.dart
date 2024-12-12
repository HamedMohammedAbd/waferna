import 'package:image_picker/image_picker.dart';

Future<XFile?>? pickeImage({required ImageSource source}) async {
  XFile? image;
  image = await ImagePicker().pickImage(
    imageQuality: 100,
    source: ImageSource.camera,
  );

  return image;
}

Future<List<XFile?>>? pickeImages() async {
  List<XFile> images = [];
  images.addAll(
    await ImagePicker().pickMultiImage(
      limit: 3,
      imageQuality: 100,
      requestFullMetadata: false,
    ),
  );
  return images;
}
