import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma_home/category_pages/all_products.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/custom_widgets/pesonal_file_section.dart';
import 'package:pharma_home/login_and_signup_pages/login.dart';
import 'package:pharma_home/store_pages/category_page.dart';
import 'package:pharma_home/store_pages/location_page.dart';
import 'package:pharma_home/store_pages/midicin_table.dart';
import 'package:pharma_home/store_pages/notification_page.dart';
import 'package:pharma_home/store_pages/show_personal_file.dart';
import 'package:pharma_home/store_pages/support_page.dart';

class PesonalFile extends StatefulWidget {
  const PesonalFile({super.key});

  @override
  _PesonalFileState createState() => _PesonalFileState();
}

class _PesonalFileState extends State<PesonalFile> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0XFF21A06A),
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => locationPage(),
                          transition: Transition.upToDown,
                          duration: Duration(seconds: 3));
                    },
                    icon: Icon(Icons.location_on),
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => category_page(),
                        transition: Transition.upToDown,
                        duration: Duration(seconds: 3));
                  },
                  icon: Icon(Icons.menu),
                  color: Kprimary_color,
                  iconSize: 35,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(18),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 170,
              decoration: BoxDecoration(
                color: Kprimary_color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'أكسب المزيد كل يوم',
                          style: TextStyle(
                              color: Kwhite_color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'نقاطك',
                            style: TextStyle(
                                color: Kwhite_color,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '58.000',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, left: 9),
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: _imageFile == null
                              ? Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Kwhite_color,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'امسح الان  ',
                                        style: TextStyle(
                                            color: Kprimary_color,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.qr_code_scanner_sharp)
                                    ],
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.file(
                                    _imageFile!,
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'رصيدك',
                            style: TextStyle(
                                color: Kwhite_color,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '500.00',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => PersonalPage(),
                      duration: Duration(seconds: 3),
                      transition: Transition.rightToLeft);
                },
                child: pesonal_file_section(section_name: 'الملف الشخصي')),
            Divider(
              color: Colors.black,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => all_products(),
                      duration: Duration(seconds: 3),
                      transition: Transition.rightToLeft);
                },
                child: pesonal_file_section(section_name: 'العناصر')),
            Divider(
              color: Colors.black,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => midicin_table(),
                      duration: Duration(seconds: 3),
                      transition: Transition.rightToLeft);
                },
                child: pesonal_file_section(section_name: 'جدول الدواء')),
            Divider(
              color: Colors.black,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => support_page(),
                    duration: Duration(seconds: 3),
                    transition: Transition.rightToLeft);
              },
              child: pesonal_file_section(section_name: 'الدعم'),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => NotificationPage(),
                      duration: Duration(seconds: 3),
                      transition: Transition.rightToLeft);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.notifications_active),
                    Text(
                      'الاشعارات',
                      style: TextStyle(fontSize: 25, color: Kprimary_color),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(() => LogInPage(),
                      duration: Duration(seconds: 3),
                      transition: Transition.rightToLeft);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        'تم تسجيل الخروج بنجاح',
                        style: TextStyle(fontSize: 20, color: Kprimary_color),
                      )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/logout.png',
                        width: 30, height: 30),
                    Text(
                      'تسجيل خروج',
                      style: TextStyle(fontSize: 25, color: Kprimary_color),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
