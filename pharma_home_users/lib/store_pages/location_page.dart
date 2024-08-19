import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_home/const_value/constrain.dart';

class locationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مواقعي '),
        centerTitle: true,
        backgroundColor: Kwhite_color,
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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  child: Image.asset(
                    'assets/images/1722808825118.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Kwhite_color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'موقعك الحالي: ${userData['real_location']}',
                      style: TextStyle(color: Kprimary_color, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Kprimary_color,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Kwhite_color)),
                    child: Center(
                        child: Text(
                      'استخدم موقعي الحالي',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
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
