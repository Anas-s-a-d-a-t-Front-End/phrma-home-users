import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharma_home/category_pages/all_products.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/logic_operations/show_products_data.dart';
import 'package:pharma_home/store_pages/Detailed%20Page%20for%20Each%20Medicine.dart';
import 'package:pharma_home/store_pages/cart_page.dart';
import 'package:pharma_home/store_pages/category_page.dart';
import 'package:pharma_home/store_pages/location_page.dart';
import 'package:pharma_home/store_pages/personal_file.dart';
import 'package:pharma_home/store_pages/search_page.dart';

import 'package:pharma_home/store_pages/show_personal_file.dart';
import 'package:pharma_home/store_pages/uplode_roshita.dart';

class UsersHomeStorePage extends StatefulWidget {
  @override
  _UsersHomeStorePageState createState() => _UsersHomeStorePageState();
}

class _UsersHomeStorePageState extends State<UsersHomeStorePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          buildHomePage(),
          CartPage(),
          uplode_roshita(),
          PesonalFile(), // Ensure `CategoryPage` is correctly imported
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(color: Kprimary_color),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          padding: EdgeInsets.all(3),
          backgroundColor: Kprimary_color,
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundGradient: LinearGradient(
            colors: [Kprimary_color, Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          gap: 20,
          onTabChange: _onItemTapped,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'الرئيسية',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'السلة',
            ),
            GButton(
              icon: Icons.file_upload_outlined,
              text: 'رفع',
            ),
            GButton(
              icon: Icons.person_sharp,
              text: 'الملف الشخصي',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomePage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          buildHeader(),
          SizedBox(height: 20),
          buildSearchBar(),
          SizedBox(height: 20),
          buildOffersCarousel(),
          SizedBox(height: 20),
          buildCategoryHeader(),
          SizedBox(height: 20),
          buildProductGrid(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildLocationButton(),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Image.asset(
            'assets/images/logo.png',
            width: 110,
            height: 110,
          ),
        ),
        buildProfileButton(),
      ],
    );
  }

  Widget buildLocationButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Color(0XFF21A06A), borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        onPressed: () {
          Get.to(() => locationPage(),
              transition: Transition.fadeIn, duration: Duration(seconds: 3));
        },
        icon: Icon(
          Icons.location_on,
        ),
        color: Colors.white,
      ),
    );
  }

  Widget buildProfileButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Color(0XFF21A06A), borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        onPressed: () {
          Get.to(
            () => category_page(), // No need to pass userId
            transition: Transition.cupertino,
            duration: Duration(seconds: 3),
          );
        },
        icon: Icon(Icons.menu),
        color: Colors.white,
      ),
    );
  }

  Widget buildSearchBar() {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => SearchPage(),
          transition: Transition.upToDown,
          duration: Duration(seconds: 3),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Container(
            padding: EdgeInsets.only(right: 15),
            height: 40,
            decoration: BoxDecoration(
                color: Color(0XFF21A06A),
                borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.search,
                  color: Kwhite_color,
                  size: 30,
                ),
                Text(
                  'أبحث',
                  style: TextStyle(color: Kwhite_color, fontSize: 18),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildOffersCarousel() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 250,
                  height: 200,
                  child: Image.asset(
                    'assets/images/offer1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 200,
                child: Image.asset(
                  'assets/images/offer2.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    'assets/images/offer3.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCategoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => category_page(),
                duration: Duration(seconds: 3), transition: Transition.fade);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'فئات',
              style: TextStyle(color: Color(0XFF21A06A), fontSize: 25),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => all_products(),
                duration: Duration(seconds: 3), transition: Transition.fade);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'عرض الكل',
              style: TextStyle(color: Color(0XFF21A06A), fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductGrid() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('allProducts').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.52,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var product = snapshot.data!.docs[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => MedicineDetailPage(medicineId: product.id),
                    duration: Duration(seconds: 3),
                    transition: Transition.cupertino);
              },
              child: CustomGoodsContainer(
                image: product['item_image'],
                text1: product['name'],
                text2: product['Medication_titer'],
                text3: product['The_scientific_name'],
                text4: product['factory_name'],
                text5: product['Category'],
                text6: product['price'],
                text7: product['old_price'],
              ),
            );
          },
        );
      },
    );
  }
}
