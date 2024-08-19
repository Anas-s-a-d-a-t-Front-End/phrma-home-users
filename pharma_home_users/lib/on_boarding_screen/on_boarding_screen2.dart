// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:pharma_home/custom_widgets/custom_on_boarding_container.dart';
import 'package:pharma_home/on_boarding_screen/on_boarding_screen3.dart';

class on_boardin_page2 extends StatelessWidget {
  const on_boardin_page2({super.key});

  @override
  Widget build(BuildContext context) {
    return custom_on_boarding_container(
      image: 'assets/images/boarding2.png',
      Title_text: 'تصفح الطب من الفئات',
      Body_text:
          'يمكنك اختيار نوع الدواء الذي تريده من خلال تصفح الفئات الموجودة أو من خلال البحث عنها',
      next_screen: on_boarding_page3(),
    );
  }
}
