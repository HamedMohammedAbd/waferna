import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileImageDesign extends StatelessWidget {
  final double width, height;
  final XFile? image;
  const FileImageDesign({
    super.key,
    required this.width,
    required this.height,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.file(
        height: height,
        width: width,
        fit: BoxFit.cover,
        File(image!.path),
      ),
    );
  }
}
