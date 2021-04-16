import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

Widget makePoint(Color color,double width,double height){
      return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            color: color.withOpacity(0.3)
          ),
          child: Animator<double>(
              duration: Duration(seconds: 1),
              tween: Tween<double>(begin: 4,end: 6),
              cycles: 0,
              builder: (anim) => Center(child: 
                  Container(
                    margin:EdgeInsets.all(anim.value),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color:color
                    ),
                  )
              ,),
          )
      );
  }