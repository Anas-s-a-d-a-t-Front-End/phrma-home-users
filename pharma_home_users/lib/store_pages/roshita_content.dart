import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/pay_method.dart';

class roshita_content extends StatefulWidget {
  const roshita_content({super.key});

  @override
  State<roshita_content> createState() => _roshita_contentState();
}

class _roshita_contentState extends State<roshita_content> {
  Color first_container_border_color = Kprimary_color;
  Color secound_container_borde_color = Kprimary_color;
  Color cart_color = Color.fromARGB(255, 136, 206, 172);
  Icon avalible = Icon(
    Icons.add,
    color: Kwhite_color,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('محتويات الوصفة الطبية'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              'حدد للمتابعة',
              style: TextStyle(
                  fontSize: 25,
                  color: Kprimary_color,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: first_container_border_color),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      first_container_border_color = Colors.red;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Kprimary_color),
                    child: Icon(
                      Icons.add,
                      color: Kwhite_color,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Column(
                  children: [
                    Text(
                      'نيفيا ووش جل',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                    ),
                    Text(
                      '60 ml',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      's.p 22000',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                    )
                  ],
                ),
                Image.asset('assets/images/pngwing.com (12).png'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: secound_container_borde_color),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secound_container_borde_color = Colors.red;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Kprimary_color),
                    child: Icon(
                      Icons.add,
                      color: Kwhite_color,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    Text(
                      'نيفيا كريم',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                    ),
                    Text(
                      '45 ml',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      's.p 22000',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                    )
                  ],
                ),
                Image.asset('assets/images/pngwing.com (13).png'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Kprimary_color),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      avalible = Icon(
                        Icons.done_outline_outlined,
                        color: Kwhite_color,
                      );
                      cart_color = Kprimary_color;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Kprimary_color),
                    child: avalible,
                  ),
                ),
                SizedBox(
                  width: 105,
                ),
                Column(
                  children: [
                    Text(
                      'الوي اورجانك',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                    ),
                    Text(
                      '1000 mg',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      's.p 25000',
                      style: TextStyle(color: Kprimary_color, fontSize: 20),
                    )
                  ],
                ),
                Image.asset('assets/images/pngwing.com (8).png'),
              ],
            ),
          ),
          SizedBox(
            height: 120,
          ),
          GestureDetector(
            onTap: () {
              if (cart_color == Kprimary_color) {
                Get.to(PayMethoud(),
                    duration: Duration(seconds: 3),
                    transition: Transition.rightToLeft);
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: 50,
              decoration: BoxDecoration(
                color: cart_color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_sharp,
                    color: Kwhite_color,
                    size: 40,
                  ),
                  Text(
                    'أضف الى السلة',
                    style: TextStyle(
                        fontSize: 20,
                        color: Kwhite_color,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
