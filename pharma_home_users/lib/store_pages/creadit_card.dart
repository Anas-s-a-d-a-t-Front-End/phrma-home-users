import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/confirm_order.dart'; // Import to use File class

class CreaditCart extends StatefulWidget {
  const CreaditCart({super.key});

  @override
  State<CreaditCart> createState() => _CreaditCartState();
}

class _CreaditCartState extends State<CreaditCart> {
  final _formKey = GlobalKey<FormState>();
  final _cardNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  File? _imageFile; // To hold the picked image

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Method to create a styled TextFormField
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      style: TextStyle(fontSize: 20, color: Kprimary_color),
      cursorColor: Kprimary_color,
      controller: controller,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 20, color: Kprimary_color),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Kprimary_color),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Kprimary_color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Kprimary_color),
        ),
        // Set cursor color here
        contentPadding:
            EdgeInsets.symmetric(horizontal: 12), // Padding inside the field
      ),
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة بطاقة ائتمان'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _imageFile == null
                        ? Image.asset(
                            'assets/images/logo.png',
                            width: 100,
                            height: 100,
                          )
                        : Image.file(
                            _imageFile!,
                            width: 100,
                            height: 100,
                          ),
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Kprimary_color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                              color: Kwhite_color,
                            ),
                          ),
                          Text(
                            'مسح البطاقة',
                            style: TextStyle(color: Kwhite_color, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: _cardNameController,
                labelText: 'الاسم',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال اسم حامل البطاقة';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: _cardNumberController,
                labelText: 'رقم البطاقة',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال رقم البطاقة';
                  }
                  if (value.length < 16) {
                    return 'رقم البطاقة غير صحيح';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildTextFormField(
                      controller: _expiryDateController,
                      labelText: 'تاريخ الانتهاء',
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال تاريخ الانتهاء';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextFormField(
                      controller: _cvvController,
                      labelText: 'رمز التحقق',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال رمز التحقق';
                        }
                        if (value.length < 3) {
                          return 'رمز التحقق غير صحيح';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم الدفع بنجاح')),
                    );
                    Get.off(confirm_order(),
                        duration: Duration(seconds: 3),
                        transition: Transition.rightToLeft);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Kprimary_color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'أدفع الفاتورة',
                      style: TextStyle(
                          color: Kwhite_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
