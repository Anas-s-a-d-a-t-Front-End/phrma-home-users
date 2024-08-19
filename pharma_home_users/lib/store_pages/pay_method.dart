import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/confirm_order.dart'; // Ensure this import is correct
import 'package:pharma_home/store_pages/creadit_card.dart'; // Ensure this import is correct

class PayMethoud extends StatefulWidget {
  const PayMethoud({super.key});

  @override
  State<PayMethoud> createState() => _PayMethoudState();
}

class _PayMethoudState extends State<PayMethoud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أختر طريقة الدفع',
          style: TextStyle(color: Kwhite_color, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Kprimary_color,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  confirm_order(), // Ensure ConfirmOrder is correctly named
                  duration: Duration(seconds: 3),
                  transition: Transition.rightToLeft,
                );
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Kprimary_color),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.attach_money_rounded,
                      size: 90,
                      color: Kwhite_color,
                    ),
                    Divider(
                      color: Kwhite_color,
                      endIndent: 20,
                      indent: 20,
                    ),
                    Text(
                      'نقدي',
                      style: TextStyle(color: Kwhite_color, fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => CreaditCart(), // Ensure CreaditCart is correctly named
                  duration: Duration(seconds: 3),
                  transition: Transition.rightToLeft,
                );
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Kprimary_color),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.credit_card_outlined,
                      size: 90,
                      color: Kwhite_color,
                    ),
                    Divider(
                      color: Kwhite_color,
                      endIndent: 20,
                      indent: 20,
                    ),
                    Text(
                      'بطاقة الائتمان',
                      style: TextStyle(color: Kwhite_color, fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
