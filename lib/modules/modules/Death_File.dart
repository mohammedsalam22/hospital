import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/death/death_file_cubit.dart';

class DeathFileForm extends StatefulWidget {
  @override
  State<DeathFileForm> createState() => _DeathFileFormState();
}

class _DeathFileFormState extends State<DeathFileForm> {
  final TextEditingController identityStatusController =
      TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController deathLocationController = TextEditingController();
  final TextEditingController deathDateController = TextEditingController();
  final TextEditingController deathHourController = TextEditingController();
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController fileDateController = TextEditingController();
  final TextEditingController deathSeenController = TextEditingController();
  final TextEditingController lastMinuteController = TextEditingController();
  final TextEditingController lastDayController = TextEditingController();
  final TextEditingController lastYearController = TextEditingController();
  final TextEditingController reasonLastHourController =
      TextEditingController();
  final TextEditingController liverMortiseLocationController =
      TextEditingController();
  final TextEditingController liverMortiseImproveController =
      TextEditingController();
  final TextEditingController liverMortiseColorController =
      TextEditingController();
  final TextEditingController rigorMortiseLocationController =
      TextEditingController();
  final TextEditingController dehydrationController = TextEditingController();
  final TextEditingController lateSignsController = TextEditingController();

  bool normal = false;
  bool notSpecified = false;
  bool nonNormal = false;
  bool liverMortiseRemoved = false;
  bool anatomy = false;
  bool autopsy = false;

  DateTime? deathDate;
  TimeOfDay? deathHour;
  String? deathSeen;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Death File Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextField(
                  controller: identityStatusController,
                  decoration: InputDecoration(labelText: 'Identity Status'),
                ),
                TextField(
                  controller: temperatureController,
                  decoration: InputDecoration(labelText: 'Temperature'),
                ),
                TextField(
                  controller: deathLocationController,
                  decoration: InputDecoration(labelText: 'Death Location'),
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: deathDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && pickedDate != deathDate) {
                      setState(() {
                        deathDate = pickedDate;
                        deathDateController.text =
                            DateFormat('yyyy-MM-dd').format(deathDate!);
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: deathDateController,
                      decoration: InputDecoration(labelText: 'Death Date'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: deathHour ?? TimeOfDay.now(),
                    );
                    if (pickedTime != null && pickedTime != deathHour) {
                      setState(() {
                        deathHour = pickedTime;
                        deathHourController.text = deathHour!.format(context);
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: deathHourController,
                      decoration: InputDecoration(labelText: 'Death Hour'),
                    ),
                  ),
                ),
                TextField(
                  controller: doctorNameController,
                  decoration: InputDecoration(labelText: 'Doctor Name'),
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        fileDateController.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: fileDateController,
                      decoration: InputDecoration(labelText: 'File Date'),
                    ),
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: deathSeen,
                  items: [
                    'pronounced dead by the doctor',
                    'Attested death',
                  ]
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  decoration: InputDecoration(labelText: 'Death Seen'),
                  onChanged: (value) {
                    setState(() {
                      deathSeen = value;
                      deathSeenController.text = value ?? '';
                    });
                  },
                ),
                TextField(
                  controller: lastMinuteController,
                  decoration: InputDecoration(labelText: 'Last Minute'),
                ),
                TextField(
                  controller: lastDayController,
                  decoration: InputDecoration(labelText: 'Last Day'),
                ),
                TextField(
                  controller: lastYearController,
                  decoration: InputDecoration(labelText: 'Last Year'),
                ),
                TextField(
                  controller: reasonLastHourController,
                  decoration: InputDecoration(labelText: 'Reason Last Hour'),
                ),
                CheckboxListTile(
                  title: Text('Anatomy'),
                  value: anatomy,
                  onChanged: (newValue) {
                    setState(() {
                      anatomy = newValue ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Autopsy'),
                  value: autopsy,
                  onChanged: (newValue) {
                    setState(() {
                      autopsy = newValue ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Normal'),
                  value: normal,
                  onChanged: (newValue) {
                    setState(() {
                      normal = newValue ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Not Specified'),
                  value: notSpecified,
                  onChanged: (newValue) {
                    setState(() {
                      notSpecified = newValue ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Non-Normal'),
                  value: nonNormal,
                  onChanged: (newValue) {
                    setState(() {
                      nonNormal = newValue ?? false;
                    });
                  },
                ),
                TextField(
                  controller: liverMortiseLocationController,
                  decoration:
                      InputDecoration(labelText: 'Liver Mortise Location'),
                ),
                TextField(
                  controller: liverMortiseImproveController,
                  decoration:
                      InputDecoration(labelText: 'Liver Mortise Improve'),
                ),
                TextField(
                  controller: liverMortiseColorController,
                  decoration: InputDecoration(labelText: 'Liver Mortise Color'),
                ),
                CheckboxListTile(
                  title: Text('Liver Mortise Removed'),
                  value: liverMortiseRemoved,
                  onChanged: (newValue) {
                    setState(() {
                      liverMortiseRemoved = newValue ?? false;
                    });
                  },
                ),
                TextField(
                  controller: rigorMortiseLocationController,
                  decoration:
                      InputDecoration(labelText: 'Rigor Mortise Location'),
                ),
                TextField(
                  controller: dehydrationController,
                  decoration: InputDecoration(labelText: 'Dehydration'),
                ),
                TextField(
                  controller: lateSignsController,
                  decoration: InputDecoration(labelText: 'Late Signs'),
                ),
                SizedBox(height: 16),
                BlocBuilder<DeathFileCubit, DeathFileState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        print("ddddd") ;
                        await BlocProvider.of<DeathFileCubit>(context).createDeathFile() ;
                      },
                      child: const Text('submit'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
