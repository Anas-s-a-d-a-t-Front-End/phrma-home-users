import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/login_and_signup_pages/signUp.dart';
import 'package:pharma_home/store_pages/users.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = false; // To toggle password visibility
  bool _isLoading = false; // To show loading indicator

  Future<void> signInUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        // Fetch user data from Firestore
        final userEmail = emailController.text;
        final userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: userEmail)
            .limit(1)
            .get();

        if (userDoc.docs.isNotEmpty) {
          final userData = userDoc.docs.first.data();
          final docId = userDoc.docs.first.id;

          // Navigate to PersonalPage and pass the user ID
          Get.offAll(() => UsersHomeStorePage(),
              transition: Transition.fade, duration: Duration(seconds: 3));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('User data not found.')));
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = 'User not found';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password';
        } else {
          errorMessage = 'An error occurred. Please try again';
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      } finally {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Kprimary_color),
        width: double.infinity,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formKey,
                child: ListView(
                  children: [
                    ClipRRect(
                      child: Image.asset('assets/images/register_page.png'),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40)),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => SignUpPage(),
                                transition: Transition.fade,
                                duration: Duration(seconds: 3));
                          },
                          child: Text(
                            'سجل هنا',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          ' ,اذا لم يكن لديك حساب',
                          style: TextStyle(color: Kwhite_color, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        cursorColor: Kwhite_color,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'الرجاء ادخال بريد الكتروني';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: TextStyle(color: Kwhite_color, fontSize: 20),
                        decoration: InputDecoration(
                          labelText: "البريد الالكتروني",
                          labelStyle: TextStyle(
                              color: Kwhite_color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Kwhite_color),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Kwhite_color),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'الرجاء ادخال كلمة مرور';
                          }
                          return null;
                        },
                        cursorColor: Kwhite_color,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        style: TextStyle(color: Kwhite_color, fontSize: 20),
                        decoration: InputDecoration(
                          labelText: "كلمة المرور",
                          labelStyle: TextStyle(
                              color: Kwhite_color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Kwhite_color),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Kwhite_color),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Kwhite_color,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => signInUser(context),
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 75),
                        decoration: BoxDecoration(
                          color: Kwhite_color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          'المتابعة',
                          style: TextStyle(fontSize: 25, color: Kprimary_color),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Kwhite_color,
                          indent: 60,
                          endIndent: 20,
                        )),
                        Text(
                          'أو من خلال',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                            child: Divider(
                          color: Kwhite_color,
                          endIndent: 60,
                          indent: 20,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Kwhite_color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Logo-google.png',
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            '       قم بتسجيل الدخول باستخدام غوغل',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
