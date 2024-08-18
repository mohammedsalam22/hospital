import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/add_Limbs_Examination/add_Limbs_Examination_Cubit.dart';
import '../../cubit/add_Limbs_Examination/add_Limbs_Examination_State.dart';
import '../../cubit/death/death_file_cubit.dart';
import '../../cubit/head/head_Cubit.dart';
import '../../cubit/head/head_State.dart';

class LimbForm extends StatefulWidget {
  @override
  State<LimbForm> createState() => _LimbFormState();
}

class _LimbFormState extends State<LimbForm> {
  // Controllers for LowerLimb section
  final TextEditingController inguinalLymphadenopathyPalpationController = TextEditingController();
  final TextEditingController oedemaAssessmentController = TextEditingController();
// Boolean fields for LowerLimb section
  bool venousLegUlcers = false;
// Controllers for Manu section
  final TextEditingController purpuraController = TextEditingController();
  final TextEditingController myatrophyController = TextEditingController();
// Boolean fields for Manu section
  bool palmarErythema = false;
  bool acrocyanosis = false;
// Controllers for ArticulationUnguisv section
  final TextEditingController neurologicalController = TextEditingController();
  final TextEditingController xanthonychiaController = TextEditingController();
  final TextEditingController punctateLeukonychiaController = TextEditingController();
  final TextEditingController periorbitalCyanosisController = TextEditingController();
// Boolean fields for ArticulationUnguisv section
  bool leukonychia = false;
  bool capillaryDilation = false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Limb File Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skin Section

                TextField(
                  controller: inguinalLymphadenopathyPalpationController,
                  decoration: InputDecoration(labelText: 'inguinalLymphadenopathyPalpationController'),
                ),
                TextField(
                  controller: oedemaAssessmentController,
                  decoration: InputDecoration(labelText: 'oedemaAssessmentController'),
                ),
                TextField(
                  controller: purpuraController,
                  decoration: InputDecoration(labelText: 'purpuraController'),
                ),
                TextField(
                  controller: myatrophyController,
                  decoration: InputDecoration(labelText: 'myatrophyController'),
                ),
                TextField(
                  controller: neurologicalController,
                  decoration: InputDecoration(labelText: 'neurologicalController'),
                ),  TextField(
                  controller: xanthonychiaController,
                  decoration: InputDecoration(labelText: 'xanthonychiaController'),
                ),  TextField(
                  controller: punctateLeukonychiaController,
                  decoration: InputDecoration(labelText: 'punctateLeukonychiaController'),
                ),  TextField(
                  controller: periorbitalCyanosisController,
                  decoration: InputDecoration(labelText: 'periorbitalCyanosisController'),
                ),
                SizedBox(height: 16),


                CheckboxListTile(
                  title: Text('venousLegUlcers'),
                  value: venousLegUlcers,
                  onChanged: (value) {
                    setState(() {
                      venousLegUlcers = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('palmarErythema'),
                  value: palmarErythema,
                  onChanged: (value) {
                    setState(() {
                      palmarErythema = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('acrocyanosis'),
                  value: acrocyanosis,
                  onChanged: (value) {
                    setState(() {
                      acrocyanosis = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('leukonychia'),
                  value: leukonychia,
                  onChanged: (value) {
                    setState(() {
                      leukonychia = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('capillaryDilation'),
                  value: capillaryDilation,
                  onChanged: (value) {
                    setState(() {
                      capillaryDilation = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Mouth Section

                SizedBox(height: 16),

                // Submit Button
                BlocBuilder<LimbCubit, LimbState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {

                          await BlocProvider.of<LimbCubit>(context).createLimb(
                            inguinalLymphadenopathyPalpation: inguinalLymphadenopathyPalpationController.text,
                            venousLegUlcers: venousLegUlcers,
                            oedemaAssessment: oedemaAssessmentController.text,
                            palmarErythema: palmarErythema,
                            purpura: purpuraController.text,
                            acrocyanosis: acrocyanosis,
                            myatrophy: myatrophyController.text,
                            neurological: neurologicalController.text,
                            xanthonychia: xanthonychiaController.text,
                            leukonychia: leukonychia,
                            punctateLeukonychia: punctateLeukonychiaController.text,
                            capillaryDilation: capillaryDilation,
                            periorbitalCyanosis: periorbitalCyanosisController.text,
                          );

                          inguinalLymphadenopathyPalpationController.clear();
                          oedemaAssessmentController.clear();
                          purpuraController.clear();
                          myatrophyController.clear();
                          neurologicalController.clear();
                          xanthonychiaController.clear();
                          punctateLeukonychiaController.clear();
                          periorbitalCyanosisController.clear();

                          // إعادة تعيين القيم المنطقية
                          setState(() {
                            venousLegUlcers = false;
                            palmarErythema = false;
                            acrocyanosis = false;
                            leukonychia = false;
                            capillaryDilation = false;
                          });
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
