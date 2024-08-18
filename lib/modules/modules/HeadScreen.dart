import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/death/death_file_cubit.dart';
import '../../cubit/head/head_Cubit.dart';
import '../../cubit/head/head_State.dart';

class HeadForm extends StatefulWidget {
  @override
  State<HeadForm> createState() => _HeadFormState();
}

class _HeadFormState extends State<HeadForm> {
  // Controllers for skin section
  final TextEditingController skinNaturalController = TextEditingController();
  final TextEditingController skinOtherController = TextEditingController();
  final TextEditingController skinHairController = TextEditingController();
  final TextEditingController color = TextEditingController();

  // Controllers for eyes section
  bool eyesPallor = false;
  bool eyesJaundice = false;
  bool eyesNystagmus = false;
  bool eyesEnophthalmos = false;
  bool eyesExophthalmos = false;

  // Controllers for mouth section
  bool mouthAtrophicGlossitis = false;
  bool mouthMacroglossia = false;
  final TextEditingController mouthColorController = TextEditingController();
  bool mouthToothDecay = false;
  bool mouthMacrogingivae = false;
  bool mouthGingivalBleeding = false;
  bool mouthUlcers = false;

  final formKey = GlobalKey<FormState>();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skin Section
                Text('Skin Section'),
                TextField(
                  controller: color,
                  decoration: InputDecoration(labelText: 'color'),
                ),
                TextField(
                  controller: skinNaturalController,
                  decoration: InputDecoration(labelText: 'Natural'),
                ),
                TextField(
                  controller: skinOtherController,
                  decoration: InputDecoration(labelText: 'Other'),
                ),
                TextField(
                  controller: skinHairController,
                  decoration: InputDecoration(labelText: 'Hair'),
                ),
                SizedBox(height: 16),

                // Eyes Section
                Text('Eyes Section'),
                CheckboxListTile(
                  title: Text('Pallor'),
                  value: eyesPallor,
                  onChanged: (value) {
                    setState(() {
                      eyesPallor = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Jaundice'),
                  value: eyesJaundice,
                  onChanged: (value) {
                    setState(() {
                      eyesJaundice = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Nystagmus'),
                  value: eyesNystagmus,
                  onChanged: (value) {
                    setState(() {
                      eyesNystagmus = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Enophthalmos'),
                  value: eyesEnophthalmos,
                  onChanged: (value) {
                    setState(() {
                      eyesEnophthalmos = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Exophthalmos'),
                  value: eyesExophthalmos,
                  onChanged: (value) {
                    setState(() {
                      eyesExophthalmos = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Mouth Section
                Text('Mouth Section'),
                CheckboxListTile(
                  title: Text('Atrophic Glossitis'),
                  value: mouthAtrophicGlossitis,
                  onChanged: (value) {
                    setState(() {
                      mouthAtrophicGlossitis = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Macroglossia'),
                  value: mouthMacroglossia,
                  onChanged: (value) {
                    setState(() {
                      mouthMacroglossia = value ?? false;
                    });
                  },
                ),
                TextField(
                  controller: mouthColorController,
                  decoration: InputDecoration(labelText: 'Color'),
                ),
                CheckboxListTile(
                  title: Text('Tooth Decay'),
                  value: mouthToothDecay,
                  onChanged: (value) {
                    setState(() {
                      mouthToothDecay = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Macrogingivae'),
                  value: mouthMacrogingivae,
                  onChanged: (value) {
                    setState(() {
                      mouthMacrogingivae = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Gingival Bleeding'),
                  value: mouthGingivalBleeding,
                  onChanged: (value) {
                    setState(() {
                      mouthGingivalBleeding = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Ulcers'),
                  value: mouthUlcers,
                  onChanged: (value) {
                    setState(() {
                      mouthUlcers = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Submit Button
                BlocBuilder<HeadCubit, HeadState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          await BlocProvider.of<HeadCubit>(context).createHead(
                            skinColor: color.text,
                            skinNatural: skinNaturalController.text,
                            skinOther: skinOtherController.text,
                            skinHair: skinHairController.text,
                            eyesPallor: eyesPallor,
                            eyesJaundice: eyesJaundice,
                            eyesNystagmus: eyesNystagmus,
                            eyesEnophthalmos: eyesEnophthalmos,
                            eyesExophthalmos: eyesExophthalmos,
                            mouthAtrophicGlossitis: mouthAtrophicGlossitis,
                            mouthMacroglossia: mouthMacroglossia,
                            mouthColor: mouthColorController.text,
                            mouthToothDecay: mouthToothDecay,
                            mouthMacrogingivae: mouthMacrogingivae,
                            mouthGingivalBleeding: mouthGingivalBleeding,
                            mouthUlcers: mouthUlcers,
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
