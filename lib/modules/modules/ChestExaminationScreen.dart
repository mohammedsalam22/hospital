import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/ChestExamination/chestExamination_Cubit.dart';
import '../../cubit/ChestExamination/chestExamination_State.dart';

class ChestExaminationForm extends StatefulWidget {
  @override
  _ChestExaminationFormState createState() => _ChestExaminationFormState();
}

class _ChestExaminationFormState extends State<ChestExaminationForm> {
  final formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController compressionsController = TextEditingController();
  final TextEditingController respiratorySoundsController = TextEditingController();

  // Boolean variables for checkboxes
  bool sideRounded = false;
  bool gynecomastia = false;
  bool orangeSkinnedBreast = false;
  bool spiderVeins = false;
  bool barrelChest = false;
  bool sternalPit = false;

  // Dropdown options
  final List<String> compressionsOptions = ['Silent', 'Hyperresonance'];
  final List<String> respiratorySoundsOptions = ['Clear and Symmetrical', 'Wheezing', 'Fine Crackles'];

  // State variables for dropdowns
  String? selectedCompressions;
  String? selectedRespiratorySounds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chest Examination Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dropdown for Compressions
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Compressions',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: selectedCompressions,
                  onChanged: (value) {
                    setState(() {
                      selectedCompressions = value;
                    });
                  },
                  items: compressionsOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),

                // Dropdown for Respiratory Sounds
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Respiratory Sounds',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: selectedRespiratorySounds,
                  onChanged: (value) {
                    setState(() {
                      selectedRespiratorySounds = value;
                    });
                  },
                  items: respiratorySoundsOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),

                // Checkbox fields
                Text('Physical Signs'),
                CheckboxListTile(
                  title: Text('Side Rounded'),
                  value: sideRounded,
                  onChanged: (value) {
                    setState(() {
                      sideRounded = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Gynecomastia'),
                  value: gynecomastia,
                  onChanged: (value) {
                    setState(() {
                      gynecomastia = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Orange Skinned Breast'),
                  value: orangeSkinnedBreast,
                  onChanged: (value) {
                    setState(() {
                      orangeSkinnedBreast = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Spider Veins'),
                  value: spiderVeins,
                  onChanged: (value) {
                    setState(() {
                      spiderVeins = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Barrel Chest'),
                  value: barrelChest,
                  onChanged: (value) {
                    setState(() {
                      barrelChest = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Sternal Pit'),
                  value: sternalPit,
                  onChanged: (value) {
                    setState(() {
                      sternalPit = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Submit button with Bloc integration
                BlocBuilder<ChestExaminationCubit, ChestExaminationState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          await BlocProvider.of<ChestExaminationCubit>(context).createChestExamination(
                            Compressions: selectedCompressions,
                            respiratorySounds: selectedRespiratorySounds,
                            sideRounded: sideRounded,
                            gynecomastia: gynecomastia,
                            orange_skinnedBreast: orangeSkinnedBreast,
                            spiderVeins: spiderVeins,
                            barrelChest: barrelChest,
                            sternalPit: sternalPit,
                          );
                        }
                      },
                      child: const Text('Submit'),
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
