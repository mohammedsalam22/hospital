import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/getPatientRadioModel.dart';
import '../../cubit/getdeathfile/getdeathfile_cubit.dart';
import '../../cubit/getdeathfile/getdeathfile_state.dart';

class GetDeathFileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeathFileCubit, GetDeathFileState>(
      builder: (context, state) {
        if (state is GetDeathFileLoading) {
          print("vvvvvvvvvvvvvvvvvv");
          return Center(child: CircularProgressIndicator());
        } else if (state is GetDeathFileError) {
          return Center(
            child: Text(
              'حدث خطأ: ${state.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state is GetDeathFileSuccess) {
          final deathFileModels = state.deathFileModel;
          return ListView.builder(
            itemCount: deathFileModels.length,
            itemBuilder: (context, index) {
              final deathFileModel = deathFileModels[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle('Death File Details'),
                  buildDetailTile('Identity Status', deathFileModel.deathFile.identityStatus),
                  buildDetailTile('Temperature', deathFileModel.deathFile.temperature),
                  buildDetailTile('Death Location', deathFileModel.deathFile.deathLocation),
                  buildDetailTile('Death Date', deathFileModel.deathFile.deathDate),
                  buildDetailTile('Death Hour', deathFileModel.deathFile.deathHour),
                  buildDetailTile('Doctor Name', deathFileModel.deathFile.doctorName),
                  buildDetailTile('File Date', deathFileModel.deathFile.fileDate),
                  buildDetailTile('Death Seen', deathFileModel.deathFile.deathSeen),
                  buildDetailTile('Patient ID', deathFileModel.deathFile.patientID.toString()),

                  buildSectionTitle('Manner of Death'),
                  ...deathFileModel.mannerOfDeath.map((manner) => buildDetailTile('Normal', manner.normal.toString())).toList(),
                  ...deathFileModel.mannerOfDeath.map((manner) => buildDetailTile('Not Specified', manner.notSpecified.toString())).toList(),
                  ...deathFileModel.mannerOfDeath.map((manner) => buildDetailTile('Non Normal', manner.nonNormal.toString())).toList(),

                  buildSectionTitle('Death Signs'),
                  ...deathFileModel.deathSigns.map((signs) => buildDetailTile('Liver Mortise Location', signs.liverMortiseLocation)).toList(),
                  ...deathFileModel.deathSigns.map((signs) => buildDetailTile('Liver Mortise Improve', signs.liverMortiseImprove)).toList(),
                  ...deathFileModel.deathSigns.map((signs) => buildDetailTile('Liver Mortise Color', signs.liverMortiseColor)).toList(),
                  ...deathFileModel.deathSigns.map((signs) => buildDetailTile('Rigor Mortise Location', signs.rigorMortiseLocation)).toList(),
                  ...deathFileModel.deathSigns.map((signs) => buildDetailTile('Dehydration', signs.dehydration)).toList(),
                  ...deathFileModel.deathSigns.map((signs) => buildDetailTile('Late Signs', signs.lateSigns)).toList(),

                  buildSectionTitle('Death Reasons'),
                  ...deathFileModel.deathReasons.map((reasons) => buildDetailTile('Last Minute', reasons.lastMinute)).toList(),
                  ...deathFileModel.deathReasons.map((reasons) => buildDetailTile('Last Day', reasons.lastDay)).toList(),
                  ...deathFileModel.deathReasons.map((reasons) => buildDetailTile('Last Year', reasons.lastYear)).toList(),
                  ...deathFileModel.deathReasons.map((reasons) => buildDetailTile('Reason Last Hour', reasons.reasonLastHour)).toList(),
                  ...deathFileModel.deathReasons.map((reasons) => buildDetailTile('Anatomy', reasons.anatomy.toString())).toList(),
                  ...deathFileModel.deathReasons.map((reasons) => buildDetailTile('Autopsy', reasons.autopsy.toString())).toList(),

                  Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                    indent: 16.0,
                    endIndent: 16.0,
                  ),
                ],
              );
            },
          );
        }
        return Center(child: Text('لا توجد بيانات.'));
      },
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF41638E),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }


  Widget buildDetailTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          '$title: $value',
          style: TextStyle(fontSize: 14, color: Color(0xFF41638E), fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
