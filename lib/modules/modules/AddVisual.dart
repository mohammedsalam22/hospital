import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/AddVisual/AddVisual_cubit.dart';
import '../../cubit/AddVisual/AddVisual_state.dart';

class AddVisualPage extends StatefulWidget {
  @override
  _AddVitalPageState createState() => _AddVitalPageState();
}

class _AddVitalPageState extends State<AddVisualPage> {
  // Controllers for string and int inputs
  final TextEditingController conscienceController = TextEditingController();
  final TextEditingController gcsController = TextEditingController();

  // Boolean variables for checkbox inputs
  bool goodCondition = false;
  bool cachecticPatient = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة فحوصات الحيوية'),
        backgroundColor: Color(0xFF41638E),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Wrapped in SingleChildScrollView to prevent overflow
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Checkbox for "Good Condition"
                CheckboxListTile(
                  title: Text('الحالة الجيدة'),
                  value: goodCondition,
                  onChanged: (bool? value) {
                    setState(() {
                      goodCondition = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 10),
                // Checkbox for "Cachectic Patient"
                CheckboxListTile(
                  title: Text('مريض هزيل'),
                  value: cachecticPatient,
                  onChanged: (bool? value) {
                    setState(() {
                      cachecticPatient = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 10),
                // TextField for "Conscience"
                TextField(
                  controller: conscienceController,
                  decoration: InputDecoration(
                    labelText: 'الوعي',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                // TextField for "GCS"
                TextField(
                  controller: gcsController,
                  decoration: InputDecoration(
                    labelText: 'GCS',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                // BlocBuilder without loading indicator
                BlocBuilder<AddVisualCubit, AddVisualState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF41638E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        // Validate and send data to the cubit
                        final String conscience = conscienceController.text.trim();
                        final int gcs = int.tryParse(gcsController.text.trim()) ?? 0;

                        // Call cubit function with await for async operation
                        await BlocProvider.of<AddVisualCubit>(context).createVisual(
                          goodCondition: goodCondition,
                          cachecticPatient: cachecticPatient,
                          conscience: conscience,
                          gcs: gcs,
                        );
                      },
                      child: Text('إرسال'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
