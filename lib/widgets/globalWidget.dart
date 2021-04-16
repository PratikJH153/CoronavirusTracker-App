import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './makePoint.dart';

class GlobalWidget extends StatelessWidget {
  final int totalConfirmed;
  final int totalDeaths;
  final int totalRec;
  final formatter = NumberFormat("##,###,###");

  GlobalWidget(
    {
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRec
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color:Colors.grey[200],
            blurRadius: 10,
            spreadRadius: 2
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                makePoint(Colors.green[400],23,23),
                Text(formatter.format(totalRec),style: TextStyle(color:Colors.black87,letterSpacing: 1,fontWeight: FontWeight.w600,fontSize: 16),),
                Text('RECOVERED',style: TextStyle(color:Colors.green[600],letterSpacing: 1,fontWeight: FontWeight.w900,fontSize: 14))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                makePoint(Colors.orange[400],23,23),
                Text(formatter.format(totalConfirmed),style: TextStyle(color:Colors.black87,letterSpacing: 1,fontWeight: FontWeight.w600,fontSize: 16)),
                Text('CONFIRMED',style: TextStyle(color:Colors.orange[600],letterSpacing: 1,fontWeight: FontWeight.w900,fontSize: 14))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                makePoint(Colors.red[400],23,23),
                Text(formatter.format(totalDeaths),style: TextStyle(color:Colors.black87,letterSpacing: 1,fontWeight: FontWeight.w600,fontSize: 16)),
                Text("DEATHS",style: TextStyle(color:Colors.red[600],letterSpacing: 1,fontWeight: FontWeight.w900,fontSize: 14))
              ],
            ),
        ],
      ),
    );
  }
}