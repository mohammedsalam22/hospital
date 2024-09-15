import 'package:flutter/material.dart';

import '../shared/shared style/colors.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key, required this.details});

  final Map details ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('المعلومات الشخصية' , style: TextStyle(color: Colors.white),),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: details.keys.length - 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       (details.keys.toList())[index] ,
                      style: const TextStyle(
                        color: AppColors.primary ,
                      ),
                    ) ,
                    Text(
                      (details.keys.toList())[index] == 'gender' ?
                      ((details.values.toList())[index] == 1 ? 'Male' : 'Female')
                      : (details.values.toList())[index].toString() ,
                      style: const TextStyle(
                        color: AppColors.black ,
                      ),
                    ) ,
                  ],
                ),
              ) ;
            },
          ),
        ),
      ),
    );
  }
}
