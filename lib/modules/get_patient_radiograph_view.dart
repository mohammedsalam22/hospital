import 'package:flutter/material.dart';
import 'package:waseem/Models/getPatientRadioModel.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

import '../../Models/getPatientRadioModel.dart';
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getPatientRadioModel.dart';
import '../../cubit/getPatientRadio/getPatientRadio_cubit.dart';
import '../../cubit/getPatientRadio/getPatientRadio_state.dart';

import 'package:http/http.dart' as http;

/////////////////////////////هاااااااااااااااااااااااااااااد المهممممممممممممممممممممممممممممممممم
/*
class RadiographItem extends StatelessWidget {
  final String baseUrl = 'http://192.168.8.16:3000/';
  final Radiograph radiograph;

  RadiographItem({required this.radiograph});

  @override
  Widget build(BuildContext context) {
    // تكوين URL الصورة وملف PDF
    String? imageUrl = radiograph.image != null ? '$baseUrl${radiograph.image}' : null;
    String? documentUrl = radiograph.document != null ? '$baseUrl${radiograph.document}' : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عرض الصورة
        if (imageUrl != null)
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),

        // عرض اسم ملف PDF والضغط عليه لفتحه
        if (documentUrl != null)
          InkWell(
            onTap: () {
              _openPDF(documentUrl!);
            },
            child: Text(
              radiograph.document!.split('/').last,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _openPDF(String url) async {
    try {
      // الحصول على مسار المجلد الخاص بالوثائق
      var dir = await getApplicationDocumentsDirectory();
      String savePath = "${dir.path}/${url.split('/').last}";

      // تحميل الملف باستخدام http وحفظه محلياً
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        File file = File(savePath);
        await file.writeAsBytes(response.bodyBytes);

        // فتح الملف
        OpenFile.open(savePath);
      } else {
        print("Failed to download file: ${response.statusCode}");
      }
    } catch (e) {
      print("Error opening PDF: $e");
    }
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';


class GetPatientRadiographView extends StatelessWidget {
  final String baseUrl = ApiConstant.baseUrl;
  late final GetPatientRadio radiograph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'جميع التحاليل للمريض'
        ),
      ),
      body: BlocBuilder<getPatientRadioCubit, getPatientRadioState>(
        builder: (context, state) {
          if (state is getPatientRadioLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is getPatientRadioError) {
            return Center(child: Text('حدث خطأ: ${state.error}', style: TextStyle(color: Colors.red)));
          } else if (state is getPatientRadioSuccess) {
            return ListView.builder(
              itemCount: state.getPatientRadio.length,
              itemBuilder: (context, index) {
                final radiograph = state.getPatientRadio[index];
                String? imageUrl = radiograph.image != null ? '${ApiConstant.base}/${radiograph.image}' : null;
                String? documentUrl = radiograph.document != null ? '${ApiConstant.base}/${radiograph.document}' : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if (radiograph.askRadiographs != null)
                      Padding(
                        padding: const EdgeInsets.all( 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E), // لون الخلفية للحاوية

                            borderRadius: BorderRadius.circular(15), // حواف دائرية بمقدار 20
                          ),
                          padding: EdgeInsets.all(8.0), // إضافة حواف داخلية
                          child: Center( // توسيط النص داخل الحاوية
                            child: Text(
                              'Ask Radiographs: ${radiograph.askRadiographs}',
                              style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: 'Poppins'), // حجم خط أصغر ولون نص أبيض
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 15), // مسافة بمقدار 15
                    if (imageUrl != null)
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2), // حواف ظاهرة
                            borderRadius: BorderRadius.circular(8), // زوايا دائرية
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover, // ملائمة الصورة داخل الحاوية
                            width: 300, // عرض الصورة بمقدار 20
                            height: 300
                            ,
                          ),
                        ),
                      ),
                    SizedBox(height: 15), // مسافة بمقدار 15
                    Center(
                      child: Text(
                        'ملف المريض',
                        style: TextStyle(fontSize: 16, fontFamily: 'Poppins',fontWeight: FontWeight.bold, color: Color(0xFF41638E)), // تنسيق النص
                        textAlign: TextAlign.center, // توسيط النص
                      ),
                    ),
                    SizedBox(height: 5),
                    if (documentUrl != null)
                      Center(
                        child: InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse(documentUrl);
                            if (await canLaunch(url.toString())) {
                              await launch(url.toString());
                            } else {
                              throw 'لا يمكن فتح الرابط: $url';
                            }
                          },
                          child: Text(
                            radiograph.document!.split('/').last,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF41638E),
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center, // توسيط النص
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          }
          return Center(child: Text('لا توجد بيانات.'));
        },
      ),
    );
  }
}
