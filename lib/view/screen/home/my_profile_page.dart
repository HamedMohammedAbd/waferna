import 'package:flutter/material.dart';

import '../../widgets/home_widget/stack_image.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StackImage(),
        ],
      ),
    );
  }
}
