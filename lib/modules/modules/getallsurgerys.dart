import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/modules/modules/surgery_details_view.dart';

import '../../cubit/get_all_surgery_cubit/getallsurgerycubit_cubit.dart';

class getAllSurgeryScreen extends StatefulWidget {
  @override
  State<getAllSurgeryScreen> createState() => _getAllSurgeryScreenState();
}

class _getAllSurgeryScreenState extends State<getAllSurgeryScreen> {
  // Example data
  List list = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetallsurgerycubitCubit>(context).getAllSurgery();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 99, 142, 1),
        title: Text(
          'All Surgery',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetallsurgerycubitCubit, GetallsurgerycubitState>(
        builder: (context, state) {
          if (state.getallsurgerycubitStatus ==
              GetallsurgerycubitStatus.loading) {
            return CircularProgressIndicator(
              color: Colors.blue,
            );
          }
          if (BlocProvider.of<GetallsurgerycubitCubit>(context).rr == null) {
            return CircularProgressIndicator(
              color: Colors.blue,
            );
          } else {
            var rr = BlocProvider.of<GetallsurgerycubitCubit>(context)
                .rr['patientSurgery'];

            return ListView.builder(
              itemCount: rr.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SurgeryDetailsView(id: rr[index]['id'], )));
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'id:${rr[index]['id']}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'created_at:    ${rr[index]['created_at']}'
                                .substring(0, 25),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
