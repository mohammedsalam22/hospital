import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/surgery_cubit/surgery_cubit.dart';

class SurgeryClass extends StatefulWidget {
  @override
  _SurgeryClassState createState() => _SurgeryClassState();
}

class _SurgeryClassState extends State<SurgeryClass> {
  final _formKey = GlobalKey<FormState>();

  String _startDate = "";
  String? _endDate;
  bool _status = false;

  // Explicitly created 10 TextEditingController instances
  final TextEditingController helperNursecontroller = TextEditingController();
  final TextEditingController ASAcontroller2 = TextEditingController();
  final TextEditingController surgerySituationcontroller3 =
      TextEditingController();
  final TextEditingController surgeryDurationcontroller =
      TextEditingController();
  final TextEditingController surgeonRoomNumbercontroller5 =
      TextEditingController();
  final TextEditingController injuryTypecontroller6 = TextEditingController();
  final TextEditingController surgeonNamecontroller7 = TextEditingController();
  final TextEditingController helperSurgeonNamecontroller8 =
      TextEditingController();
  final TextEditingController nurseNamecontroller9 = TextEditingController();
  final TextEditingController surgeryNamecontroller10 = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromRGBO(65, 99, 142, 1),
        centerTitle: true,
        title: const Text(
          'SurgeryPage',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Start Date Picker
              ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040),
                      currentDate: _selectedDate,
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        _startDate = DateFormat('yyyy-MM-dd')
                            .format(_selectedDate!)
                            .toString();
                      });
                    }
                  },
                  child: Text('اضافة تاريخ')),
              SizedBox(height: 16.0),
              // End Date Picker
              ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040),
                      currentDate: _selectedDate,
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        _endDate = DateFormat('yyyy-MM-dd')
                            .format(_selectedDate!)
                            .toString();
                      });
                    }
                  },
                  child: Text('اضافة تاريخ')),
              SizedBox(height: 16.0),
              // Status Checkbox

              SizedBox(height: 16.0),
              // TextFormFields
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: surgeonNamecontroller7,
                decoration: InputDecoration(
                  labelText: 'sergeon name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: helperSurgeonNamecontroller8,
                decoration: InputDecoration(
                  labelText: 'HelperSergeonName',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: nurseNamecontroller9,
                decoration: InputDecoration(
                  labelText: 'Nurse Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: surgeonRoomNumbercontroller5,
                decoration: InputDecoration(
                  labelText: 'SeargonRoomNumber',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: surgeryNamecontroller10,
                decoration: InputDecoration(
                  labelText: 'Seargry Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: helperNursecontroller,
                decoration: InputDecoration(
                  labelText: 'HelperNurse',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: injuryTypecontroller6,
                decoration: InputDecoration(
                  labelText: 'Injury Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: ASAcontroller2,
                decoration: InputDecoration(
                  labelText: 'ASA',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: surgerySituationcontroller3,
                decoration: InputDecoration(
                  labelText: 'Surgery Situation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: surgeryDurationcontroller,
                decoration: InputDecoration(
                  labelText: 'Surgery Duration',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Antipaiutic',
                      style: TextStyle(fontSize: 17),
                    ),
                    Checkbox(
                      value: _status,
                      onChanged: (bool? value) {
                        setState(() {
                          _status = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // Submit Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: BlocConsumer<SurgeryCubit, SurgeryState>(
                  listener: (context, state) async {
                    if (state.surgery_status == Surgery_Status.loading) {
                      CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }
                    if (state.surgery_status == Surgery_Status.success) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('check in successfully')));
                      (color: Colors.blue,);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(65, 99, 142, 1),
                      )),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<SurgeryCubit>(context)
                              .postSurgery(
                                  injuryTypecontroller6.text,
                                  ASAcontroller2.text,
                                  surgerySituationcontroller3.text,
                                  surgeryDurationcontroller.text,
                                  _status,
                                  surgeonNamecontroller7.text,
                                  helperSurgeonNamecontroller8.text,
                                  nurseNamecontroller9.text,
                                  surgeryNamecontroller10.text,
                                  helperNursecontroller.text,
                                  int.parse(surgeonRoomNumbercontroller5.text),
                                  _startDate,
                                  _endDate);
                          // Process the data
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('siiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii')),
                          );
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
