import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/add_abdomen_examination/add_abdomen_examination_State.dart';
import '../../cubit/add_abdomen_examination/add_abdomen_examination_cubit.dart';
import '../../cubit/death/death_file_cubit.dart';
import '../../cubit/head/head_Cubit.dart';
import '../../cubit/head/head_State.dart';

class abdomenScreen extends StatefulWidget {
  @override
  State<abdomenScreen> createState() => _abdomenState();
}
/*required String? macBrownie,
required String? murphy,
required bool rooftopping,
required String? milia,
required String? myoclonus,
required String? distendedAbdomen,
required bool Umbilical_Fold_Disappearance,
required String? abdominalRespiration,
required bool hernia,
required bool sideRounded,
required String? surgicalScar,
required String? rashes,*/

class _abdomenState extends State<abdomenScreen> {
  // Controllers for skin section
  final TextEditingController macBrownieController = TextEditingController();
  final TextEditingController murphyController = TextEditingController();
  final TextEditingController miliaController = TextEditingController();
  final TextEditingController myoclonusController = TextEditingController();
  final TextEditingController distendedAbdomenController = TextEditingController();
  final TextEditingController abdominalRespirationController = TextEditingController();
  final TextEditingController surgicalScarController = TextEditingController();
  final TextEditingController rashesController = TextEditingController();
  // Controllers for eyes section
  bool rooftopping = false;
  bool Umbilical_Fold_Disappearance = false;
  bool hernia = false;
  bool sideRounded = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('  abdomenScreen'),
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
                  controller: macBrownieController,
                  decoration: InputDecoration(labelText: 'macBrownie'),
                ),
                TextField(
                  controller: murphyController,
                  decoration: InputDecoration(labelText: 'murphy'),
                ),
                TextField(
                  controller: miliaController,
                  decoration: InputDecoration(labelText: 'milia'),
                ),
                TextField(
                  controller: myoclonusController,
                  decoration: InputDecoration(labelText: 'myoclonus'),
                ),
                TextField(
                  controller: distendedAbdomenController,
                  decoration: InputDecoration(labelText: 'distendedAbdomen'),
                ), TextField(
                  controller: abdominalRespirationController,
                  decoration: InputDecoration(labelText: 'abdominalRespiration'),
                ), TextField(
                  controller: surgicalScarController,
                  decoration: InputDecoration(labelText: 'surgicalScar'),
                ), TextField(
                  controller: rashesController,
                  decoration: InputDecoration(labelText: 'rashes'),
                ),
                SizedBox(height: 16),

                // Eyes Section

                CheckboxListTile(
                  title: Text('rooftopping'),
                  value: rooftopping,
                  onChanged: (value) {
                    setState(() {
                      rooftopping = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Umbilical_Fold_Disappearance'),
                  value: Umbilical_Fold_Disappearance,
                  onChanged: (value) {
                    setState(() {
                      Umbilical_Fold_Disappearance = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('hernia'),
                  value: hernia,
                  onChanged: (value) {
                    setState(() {
                      hernia = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('sideRounded'),
                  value: sideRounded,
                  onChanged: (value) {
                    setState(() {
                      sideRounded = value ?? false;
                    });
                  },
                ),

                SizedBox(height: 16),



                // Submit Button
                BlocBuilder<abdomenCubit, abdomenState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          await BlocProvider.of<abdomenCubit>(context).createabdomen(
                            macBrownie: macBrownieController.text,
                            murphy: murphyController.text,
                            rooftopping: rooftopping,
                            milia: miliaController.text,
                            myoclonus: myoclonusController.text,
                            distendedAbdomen: distendedAbdomenController.text,
                            Umbilical_Fold_Disappearance: Umbilical_Fold_Disappearance,
                            abdominalRespiration: abdominalRespirationController.text,
                            hernia: hernia,
                            sideRounded: sideRounded,
                            surgicalScar: surgicalScarController.text,
                            rashes: rashesController.text,
                          );
                        }
                      },
                      child: const Text('Submit'),
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
