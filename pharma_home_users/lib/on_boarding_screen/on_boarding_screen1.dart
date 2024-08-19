// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:pharma_home/custom_widgets/custom_on_boarding_container.dart';
import 'package:pharma_home/on_boarding_screen/on_boarding_screen2.dart';

class on_boarding1 extends StatelessWidget {
  const on_boarding1({super.key});
  @override
  Widget build(BuildContext context) {
    return custom_on_boarding_container(
      image: 'assets/images/boarding1.png',
      Title_text: 'اسأل الطبيب عن حالتك',
      Body_text:
          'يمكنك استشارة الطبيب حول حالتك الطبية حتى يصف لك الدواء المناسب',
      next_screen: on_boardin_page2(),
    );
  }
}
