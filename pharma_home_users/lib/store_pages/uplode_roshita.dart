import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/category_page.dart';
import 'package:pharma_home/store_pages/location_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pharma_home/store_pages/roshita_content.dart';
import 'dart:ui'; // Import for BackdropFilter

class uplode_roshita extends StatefulWidget {
  const uplode_roshita({super.key});

  @override
  State<uplode_roshita> createState() => _uplode_roshitaState();
}

class _uplode_roshitaState extends State<uplode_roshita> {
  File? _image; // Variable to hold the picked image

  final ImagePicker _picker = ImagePicker(); // Image picker instance

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image =
            File(pickedFile.path); // Update the state with the picked image
      });
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(
                  0.5), // Apply a semi-transparent black background
            ),
          ),
          AlertDialog(
            content: Text(
              'يود "فارما هوم"الوصول الى الكاميرا هذا سيسمح لك بالتقاط الصور',
              style: TextStyle(
                  color: Kprimary_color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'عدم السماح',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          _pickImage();
                        },
                        child: Text(
                          'السماح',
                          style: TextStyle(
                              color: Kprimary_color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الوصفة الطبية الخاصة بك'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 60, left: 50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0XFF21A06A),
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => locationPage(),
                        transition: Transition.fadeIn,
                        duration: Duration(seconds: 3));
                  },
                  icon: Icon(Icons.location_on),
                  color: Colors.white,
                  // iconSize: 35,
                ),
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _showImagePickerDialog();
            },
            child: Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DottedBorder(
                color: Kprimary_color,
                strokeWidth: 1.5,
                child: Center(
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Kprimary_color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.camera_enhance,
                                size: 50,
                                color: Kwhite_color,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'قم بتحميل صورة\n الوصفة الطبية الخاصة بك',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'قم بتحميل نسخة واضحة من وصفتك الطبية للحصول على نتيجة افضل ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(roshita_content(),
                  duration: Duration(seconds: 3),
                  transition: Transition.rightToLeft);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              decoration: BoxDecoration(
                color: Kprimary_color,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  'أستمرار',
                  style: TextStyle(
                      color: Kwhite_color,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
