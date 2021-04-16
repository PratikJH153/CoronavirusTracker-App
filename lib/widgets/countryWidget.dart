import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryWidget extends StatelessWidget {
  final String country;
  final int newconf;
  final int totalconf;
  final int newrec;
  final int totalrec;
  final int newdeaths;
  final int totaldeaths;
  final String image;
  final formatter = NumberFormat("##,###,###");


  CountryWidget(
    {
      this.country,
      this.newconf,
      this.totalconf,
      this.newrec,
      this.totalrec,
      this.newdeaths,
      this.totaldeaths,
      this.image
    }
  );

  void bottomSheet(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (ctx) {
        return Container(
          height: 700,
          color: Color(0xFF737373),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:30,vertical:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(20))
              ),
            child:Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.drag_handle,color:Colors.black87),
                ),
                SizedBox(height:30),
                Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(country,style: TextStyle(color:Colors.black87,fontSize:23,fontWeight:FontWeight.w700),),
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  
              ],
            ),
            SizedBox(height:25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green
                  ),
                ),
                SizedBox(width:8),
                Text('New Recovered',style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                Spacer(),
                Text(formatter.format(newrec),style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                
              ],
            ),
            SizedBox(height:6),
                  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green
                  ),
                ),
                SizedBox(width:7),
                Text('Total Recovered',style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                Spacer(),
                Text(formatter.format(totalrec),style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                
              ],
            ),
            SizedBox(height:8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange
                  ),
                ),
                SizedBox(width:7),
                Text('New Confirmed',style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                Spacer(),
                Text(formatter.format(newconf),style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                
              ],
            ),
            SizedBox(height:8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange
                  ),
                ),
                SizedBox(width:7),
                Text('Total Confirmed',style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                Spacer(),
                Text(formatter.format(totalconf),style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                
              ],
            ),
            SizedBox(height:8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                ),
                SizedBox(width:7),
                Text('New Deaths',style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                Spacer(),
                Text(formatter.format(newdeaths),style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                
              ],
            ),
            SizedBox(height:8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                ),
                SizedBox(width:7),
                Text('Total Deaths',style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                Spacer(),
                Text(formatter.format(totaldeaths),style: TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
                
              ],
            ),
            Container(
              padding: EdgeInsets.only(top:30),
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                color: Colors.cyan[600],
                onPressed: () => Navigator.pop(ctx), 
                child: Text('Done',
                  style: TextStyle(
                    color:Colors.white,
                    fontSize:18,
                    fontWeight:FontWeight.w500
                  ),
                )
              )
            )
          ],
        )
      ),
    );
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> bottomSheet(context),
          child: Container(
        margin: EdgeInsets.only(right:15,top: 10,bottom: 10,left:5),
        padding: EdgeInsets.only(top:20,left:10,right:10),
        height:200,
        width:180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:Colors.grey[200],
              blurRadius: 10,
              spreadRadius: 2
            )]),
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Align(alignment: Alignment.topLeft,child: Text(country,style: TextStyle(fontSize:16,fontWeight: FontWeight.w600))),
                SizedBox(height:30),
                Align(
                   alignment: Alignment.centerLeft,
                   child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(imageUrl:  image,fit: BoxFit.cover,),
                  ),
                )  
              ],
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green
                  ),
                ),
                SizedBox(width:7),
                Text('Recovered'),
                Spacer(),
                Text(formatter.format(totalrec)),
                
              ],
            ),
            SizedBox(height:6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange
                  ),
                ),
                SizedBox(width:7),
                Text('Confirmed'),
                Spacer(),
                Text(formatter.format(totalconf)),
                
              ],
            ),
            SizedBox(height:6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                ),
                SizedBox(width:7),
                Text('Deaths'),
                Spacer(),
                Text(formatter.format(totaldeaths)),
                
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:13),
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Read More',style: TextStyle(color:Colors.cyan[800],fontSize: 13,fontWeight: FontWeight.w700),),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
