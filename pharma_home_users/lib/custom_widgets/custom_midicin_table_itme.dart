import 'package:flutter/material.dart';
import 'package:pharma_home/const_value/constrain.dart';

class midicine_table_itme extends StatelessWidget {
  midicine_table_itme({this.midicine_name, this.dous, this.houre});
  String? midicine_name;
  String? dous;
  String? houre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 117,
      height: 100,
      decoration: BoxDecoration(
        color: Kprimary_color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$midicine_name' ?? '',
            style: TextStyle(color: Kwhite_color, fontSize: 18),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$dous ' ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Image.asset(
                'assets/images/pills-bottle.png',
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 50),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Kwhite_color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$houre ' ?? ''),
                Image.asset(
                  'assets/images/clock.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
