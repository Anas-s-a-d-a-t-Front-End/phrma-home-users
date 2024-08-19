// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/category_pages/hair_care.dart';
import 'package:pharma_home/category_pages/makeup.dart';
import 'package:pharma_home/category_pages/medicine.dart';
import 'package:pharma_home/category_pages/midical_device.dart';
import 'package:pharma_home/category_pages/natural.dart';
import 'package:pharma_home/category_pages/perfume.dart';
import 'package:pharma_home/category_pages/sport_item.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/custom_widgets/custom_cctegory.dart';
import 'package:pharma_home/store_pages/search_page.dart';

class category_page extends StatelessWidget {
  const category_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفئات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SearchPage(),
                    duration: Duration(seconds: 3),
                    transition: Transition.upToDown);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                height: 40,
                decoration: BoxDecoration(
                    color: Kprimary_color,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ابحث عن فئة',
                      style: TextStyle(color: Kwhite_color, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Kwhite_color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 610,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => MidicinPage(),
                            transition: Transition.leftToRight,
                            duration: Duration(seconds: 3));
                      },
                      child: coustm_category_container(
                          category_image: 'assets/images/Group 2816.png',
                          category_name: 'أدوية'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => makeup(),
                            transition: Transition.leftToRight,
                            duration: Duration(seconds: 3));
                      },
                      child: coustm_category_container(
                          category_image: 'assets/images/Group 2817.png',
                          category_name: 'مستحضرات تجميل'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => perfum(),
                            transition: Transition.leftToRight,
                            duration: Duration(seconds: 3));
                      },
                      child: coustm_category_container(
                          category_image: 'assets/images/Group 2815.png',
                          category_name: 'العطور'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => medical_device(),
                            transition: Transition.leftToRight,
                            duration: Duration(seconds: 3));
                      },
                      child: coustm_category_container(
                          category_image: 'assets/images/Group 2814.png',
                          category_name: 'أجهزة طبية'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => sport_item(),
                            transition: Transition.leftToRight,
                            duration: Duration(seconds: 3));
                      },
                      child: coustm_category_container(
                          category_image:
                              'assets/images/fitness-supplements-bottles-composition.png',
                          category_name: 'مكملات رياضية'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => hairCare(),
                            transition: Transition.leftToRight,
                            duration: Duration(seconds: 3));
                      },
                      child: coustm_category_container(
                          category_image: 'assets/images/product_15902779.png',
                          category_name: 'عناية بالشعر'),
                    ),
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
