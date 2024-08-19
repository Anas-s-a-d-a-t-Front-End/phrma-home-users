import 'dart:async'; // Import the async library for Timer
import 'package:flutter/material.dart';
import 'package:pharma_home/const_value/constrain.dart'; // Ensure this file exists and contains Kprimary_color

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  // Define color variables
  Color _orderReceivedColor = Colors.black;
  Color _orderConfirmedColor = Colors.black;
  Color _orderEndColor = Colors.black;
  Color _orderGoColor = Colors.black;
  Color _orderInHomeColor = Colors.black;

  @override
  void initState() {
    super.initState();

    // Set up timers to change colors after specified intervals
    Timer(Duration(seconds: 5), () {
      setState(() {
        _orderReceivedColor = Kprimary_color; // Change to desired color
      });
    });

    Timer(Duration(seconds: 10), () {
      setState(() {
        _orderConfirmedColor = Kprimary_color; // Change to desired color
      });
    });

    Timer(Duration(seconds: 15), () {
      setState(() {
        _orderEndColor = Kprimary_color; // Change to desired color
      });
    });

    Timer(Duration(seconds: 20), () {
      setState(() {
        _orderGoColor = Kprimary_color; // Change to desired color
      });
    });

    Timer(Duration(seconds: 25), () {
      setState(() {
        _orderInHomeColor = Kprimary_color; // Change to desired color
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تتبع الطلب',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '#115000',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Kprimary_color),
                ),
                Text(
                  ' : رقم الطلب',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            'تم الطلب',
                            style: TextStyle(
                                color: _orderReceivedColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(
                          ' لقد تلقينا طلبك في',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            '14/8/2024  12:45 PM',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/images/Group 2538.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          'تم تاكيد الطلب',
                          style: TextStyle(
                              color: _orderConfirmedColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' لقد تم التاكيد في',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            '14/8/2024  12:50 PM',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/images/Group 2539.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          'تم انهاء الطلب',
                          style: TextStyle(
                              color: _orderEndColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'نحن نقوم بتحضير طلبك',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/images/Group 2540.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Text(
                            'خارج للتوصيل',
                            style: TextStyle(
                                color: _orderGoColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'طلبك خارج للتسليم',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/images/Group 2541.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          'في منزلك',
                          style: TextStyle(
                            color: _orderInHomeColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'طلبك الان في  منزلك',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/images/Group 2542.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
