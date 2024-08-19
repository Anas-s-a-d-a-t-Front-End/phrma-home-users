import 'package:flutter/material.dart';
import 'package:pharma_home/const_value/constrain.dart';
import 'package:pharma_home/custom_widgets/custom_midicin_table_itme.dart';

class midicin_table extends StatefulWidget {
  const midicin_table({super.key});

  @override
  State<midicin_table> createState() => _midicin_tableState();
}

class _midicin_tableState extends State<midicin_table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جدول الدواء'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '8:00 ص ',
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  'الصباح , قبل الافطار',
                  style: TextStyle(
                      color: Kprimary_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                midicine_table_itme(
                  midicine_name: 'اسبرين باير',
                  dous: 'حبة 1',
                  houre: '8:00',
                ),
                midicine_table_itme(
                  midicine_name: 'اسبرين باير',
                  dous: 'حبة 1',
                  houre: '8:00',
                ),
                midicine_table_itme(
                  midicine_name: 'اسبرين باير',
                  dous: 'حبة 1',
                  houre: '8:00',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '11:00 ص ',
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  'الصباح , بعد الافطار',
                  style: TextStyle(
                      color: Kprimary_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                midicine_table_itme(
                  midicine_name: 'كولدكسترا',
                  dous: 'حبة 1',
                  houre: '11:00',
                ),
                midicine_table_itme(
                  midicine_name: 'كولدكسترا',
                  dous: 'حبة 1',
                  houre: '11:00',
                ),
                midicine_table_itme(
                  midicine_name: 'كولدكسترا',
                  dous: 'حبة 1',
                  houre: '11:00',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3:00 م',
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  'المساء , قبل الغداء',
                  style: TextStyle(
                      color: Kprimary_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                midicine_table_itme(
                  midicine_name: 'سانسوديكس',
                  dous: 'حبة 1',
                  houre: '3:00',
                ),
                midicine_table_itme(
                  midicine_name: 'سانسوديكس',
                  dous: 'حبة 1',
                  houre: '3:00',
                ),
                midicine_table_itme(
                  midicine_name: 'سانسوديكس',
                  dous: 'حبة 1',
                  houre: '3:00',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5:00 م',
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  'المساء , بعد الغداء',
                  style: TextStyle(
                      color: Kprimary_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                midicine_table_itme(
                  midicine_name: 'أمديلوبين',
                  dous: 'حبة 1',
                  houre: '5:00',
                ),
                midicine_table_itme(
                  midicine_name: 'أمديلوبين',
                  dous: 'حبة 1',
                  houre: '5:00',
                ),
                midicine_table_itme(
                  midicine_name: 'أمديلوبين',
                  dous: 'حبة 1',
                  houre: '5:00',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '8:00 م',
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  'المساء , بعد العشاء',
                  style: TextStyle(
                      color: Kprimary_color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                midicine_table_itme(
                  midicine_name: 'سولينفات',
                  dous: 'حبة 1',
                  houre: '8:00',
                ),
                midicine_table_itme(
                  midicine_name: 'سولينفات',
                  dous: 'حبة 1',
                  houre: '8:00',
                ),
                midicine_table_itme(
                  midicine_name: 'سولينفات',
                  dous: 'حبة 1',
                  houre: '8:00',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
