// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:pharma_home/custom_widgets/custom_on_boarding_container.dart';
import 'package:pharma_home/on_boarding_screen/on_boarding_screen4.dart';

class on_boarding_page3 extends StatelessWidget {
  const on_boarding_page3({super.key});

  @override
  Widget build(BuildContext context) {
    return custom_on_boarding_container(
        image: 'assets/images/boarding3.png',
        Title_text: 'خدمة الدفع',
        Body_text:
            'يمكنك الدفع بأي طريقة تريدها عن طريق الدفع نقدًا أو باستخدام بطاقات الائتمان',
        next_screen: on_boarding_page4());
  }
}
