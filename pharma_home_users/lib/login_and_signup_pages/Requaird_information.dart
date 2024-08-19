import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/store_pages/users.dart';

class RequiredInformationPage extends StatefulWidget {
  @override
  _RequiredInformationPageState createState() =>
      _RequiredInformationPageState();
}

class _RequiredInformationPageState extends State<RequiredInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController realLocationController = TextEditingController();
  final TextEditingController secoundaryLocationController =
      TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  bool isloading = false;

  XFile? _image; // Variable to store the selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  @override
  void dispose() {
    firstNameController.dispose();
    emailcontroller.dispose();
    phoneController.dispose();
    realLocationController.dispose();
    lastNameController.dispose();
    secoundaryLocationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef = storageRef
          .child('user_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = imagesRef.putFile(image);

      await uploadTask;
      final downloadUrl = await imagesRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please upload a profile image')));
        return;
      }

      setState(() {
        isloading = true; // Start loading
      });

      // Upload the image and get the URL
      String? imageUrl = await _uploadImage(File(_image!.path));

      if (imageUrl == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to upload image')));
        setState(() {
          isloading = false; // Stop loading
        });
        return;
      }

      Map<String, dynamic> dataToSave = {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'phone': phoneController.text,
        'real_location': realLocationController.text,
        'secoundary_location': secoundaryLocationController.text,
        'user_image': imageUrl,
        'email': emailcontroller.text
      };

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User not authenticated')));
        setState(() {
          isloading = false; // Stop loading
        });
        return;
      }

      String userId = user.uid;

      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userId)
            .set(dataToSave);

        // Navigate to PersonalPage
        Get.offAll(() => UsersHomeStorePage(),
            duration: Duration(seconds: 3), transition: Transition.leftToRight);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("تمت إضافة بياناتك بنجاح"),
          duration: Duration(seconds: 6),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("حدث خطأ أثناء حفظ البيانات"),
          duration: Duration(seconds: 6),
        ));
      } finally {
        setState(() {
          isloading = false; // Stop loading
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معلومات مطلوبة',
            style: TextStyle(color: Kprimary_color, fontSize: 25)),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: _image == null
                      ? Container(
                          height: 200,
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(250),
                              color: Kprimary_color),
                          child: Center(
                            child: Text(
                              'الرجاء اختيار صورة',
                              style: TextStyle(
                                  color: Kwhite_color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: Image.file(
                            File(_image!.path),
                            width: 100,
                            height: 350,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: firstNameController,
                  labelText: 'الاسم الاول',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء ادخال الاسم الاول';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: lastNameController,
                  labelText: 'الاسم الثاني',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء ادخال الاسم الثاني';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: phoneController,
                  labelText: 'رقم الموبايل',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الموبايل';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: realLocationController,
                  labelText: 'العنوان الحالي',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال العنوان الحالي';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  keyboardType: TextInputType.text,
                  controller: secoundaryLocationController,
                  labelText: 'العنوان الثاني (اختياري)',
                ),
                SizedBox(height: 20),
                _buildTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  labelText: 'البريد الالكتروني',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال البريد الالكتروني';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _saveUserData,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Kprimary_color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'متابعة',
                        style: TextStyle(
                            color: Kwhite_color,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      style: TextStyle(fontSize: 25),
      keyboardType: keyboardType,
      cursorColor: Kwhite_color,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 20, color: Kprimary_color),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Kprimary_color),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Kprimary_color),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      validator: validator,
    );
  }
}
