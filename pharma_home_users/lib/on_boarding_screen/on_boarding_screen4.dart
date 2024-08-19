// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:pharma_home/custom_widgets/custom_on_boarding_container.dart';
import 'package:pharma_home/login_and_signup_pages/login.dart';

class on_boarding_page4 extends StatelessWidget {
  const on_boarding_page4({super.key});

  @override
  Widget build(BuildContext context) {
    return custom_on_boarding_container(
        image: 'assets/images/boarding4.png',
        Title_text: 'خدمة التوصيل',
        Body_text: 'يمكنك الحصول على طلبك بسرعة كبيرة وفي نفس اليوم',
        next_screen: LogInPage());
  }
}
