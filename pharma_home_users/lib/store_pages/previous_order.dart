import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/confirm_order.dart';
import 'package:pharma_home/store_pages/pay_method.dart';

class previous_order extends StatefulWidget {
  const previous_order({super.key});

  @override
  State<previous_order> createState() => _previous_orderState();
}

class _previous_orderState extends State<previous_order> {
  Color first_container_border_color = Kprimary_color;
  Color secound_container_borde_color = Kprimary_color;
  int count = 1;
  Icon avalible = Icon(
    Icons.add,
    color: Kwhite_color,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات السابقة'),
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
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: first_container_border_color),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          first_container_border_color = Colors.red;
                        });
                      },
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Kprimary_color),
                              child: Icon(
                                Icons.add,
                                color: Kwhite_color,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('$count'),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count == 1) {
                                  count == 1;
                                } else {
                                  count--;
                                }
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Kprimary_color),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Kwhite_color, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                Divider(
                  color: Kprimary_color,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.replay_outlined),
                    GestureDetector(
                      onTap: () {
                        Get.to(PayMethoud(),
                            duration: Duration(seconds: 3),
                            transition: Transition.downToUp);
                      },
                      child: Text(
                        '  أعادة الطلب',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: secound_container_borde_color),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          secound_container_borde_color = Colors.red;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Kprimary_color),
                            child: Icon(
                              Icons.add,
                              color: Kwhite_color,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('1'),
                          ),
                          Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Kprimary_color),
                              child: Center(
                                  child: Text(
                                '-',
                                style: TextStyle(
                                    color: Kwhite_color, fontSize: 20),
                              ))),
                        ],
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
                Divider(
                  color: Kprimary_color,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.replay_rounded),
                    Text(
                      'اعادة الطلب',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Kprimary_color),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          avalible = Icon(
                            Icons.done_outline_outlined,
                            color: Kwhite_color,
                          );
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Kprimary_color),
                        child: avalible,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('1'),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          avalible = Icon(
                            Icons.done_outline_outlined,
                            color: Kwhite_color,
                          );
                        });
                      },
                      child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Kprimary_color),
                          child: Center(
                            child: Text(
                              '-',
                              style:
                                  TextStyle(fontSize: 25, color: Kwhite_color),
                            ),
                          )),
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
                Divider(
                  color: Kprimary_color,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.replay_rounded),
                    Text(
                      'أعادة الطلب',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
