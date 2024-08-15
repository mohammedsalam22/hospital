import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/getsummarychagemodel.dart';

Widget oncethinginmodel({
  required SummaryDischarge summaryDischarge,

required String inChargeDoctor,

}) =>

Padding(
padding: const EdgeInsets.all( 8.0),
child: Container(
decoration: BoxDecoration(
color: Color(0xFF41638E),
borderRadius: BorderRadius.circular(15),
),
padding: EdgeInsets.all(8.0),
child: Center( // توسيط النص داخل الحاوية
child: Text(
'Ask Radiographs: ${summaryDischarge.inChargeDoctor}',
style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: 'Poppins'), // حجم خط أصغر ولون نص أبيض
),
),
),
);