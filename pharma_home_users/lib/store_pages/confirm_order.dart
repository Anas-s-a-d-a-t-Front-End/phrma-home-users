import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/accept_order.dart';
import 'package:pharma_home/store_pages/track_order.dart';
import 'package:pharma_home/store_pages/users.dart';

class confirm_order extends StatefulWidget {
  const confirm_order({super.key});

  @override
  State<confirm_order> createState() => _confirm_orderState();
}

class _confirm_orderState extends State<confirm_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Image.asset('assets/images/confirm_order.png'),
          SizedBox(
            height: 60,
          ),
          Text(
            'طلبك في الطريق',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Kprimary_color),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '.تم تقديم طلبك بنجاح',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'للمزيد من التفاصيل تتبع الطلب',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'وقت التسليم المتوقع : 30 دقيقة',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Kprimary_color),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => TrackOrder(),
                  duration: Duration(seconds: 3),
                  transition: Transition.rightToLeft);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              height: 50,
              decoration: BoxDecoration(
                  color: Kprimary_color,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'تتبع الطلب',
                  style: TextStyle(
                      color: Kwhite_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Get.off(UsersHomeStorePage(),
                  duration: Duration(seconds: 3), transition: Transition.fade);
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                  color: Kprimary_color,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'العودة للقائمة الرئيسية',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Kwhite_color),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
