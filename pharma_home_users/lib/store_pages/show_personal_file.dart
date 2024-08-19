import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/logic_operations/edit_pesonal_page.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ملفي الشخصي'),
        centerTitle: true,
        backgroundColor: Kprimary_color,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Kprimary_color),
        child: FutureBuilder<DocumentSnapshot>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('User data not found.'));
            }

            // User data retrieved successfully
            var userData = snapshot.data!.data() as Map<String, dynamic>;
            print('User Data: $userData'); // Debugging line

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Display user data
                  SizedBox(
                    height: 10,
                  ),
                  if (userData['user_image'] != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            userData['user_image'],
                            height: 350,
                            width: 260,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('الاسم الاول : ${userData['first_name']}',
                      style: TextStyle(fontSize: 30, color: Kwhite_color)),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),

                  Text('الاسم الثاني : ${userData['last_name']}',
                      style: TextStyle(fontSize: 30, color: Kwhite_color)),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),

                  Text(
                    ' رقم الهاتف: ${userData['phone']}',
                    style: TextStyle(fontSize: 30, color: Kwhite_color),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => EditProfilePage(userData: userData),
                        transition: Transition.downToUp,
                        duration: Duration(seconds: 3),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 120),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Kwhite_color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'تعديل الملف ',
                          style: TextStyle(
                              fontSize: 22,
                              color: Kprimary_color,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<DocumentSnapshot> getUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      print('No user logged in'); // Debugging line
      throw Exception('User not logged in');
    }

    print('Fetching data for user ID: $userId'); // Debugging line
    return FirebaseFirestore.instance.collection('Users').doc(userId).get();
  }
}
