import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/get_sugery_details_cubit/getsurgerydetails_cubit.dart';

class SurgeryDetailsView extends StatefulWidget {
  const SurgeryDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<SurgeryDetailsView> createState() => _SurgeryDetailsViewState();
}

class _SurgeryDetailsViewState extends State<SurgeryDetailsView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetsurgerydetailsCubit>(context)
          .getSurgeryDetails(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Surgery Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromRGBO(65, 99, 142, 1),
      ),
      body: BlocBuilder<GetsurgerydetailsCubit, GetsurgerydetailsState>(
        builder: (context, state) {

          if (state.getsurgerydetailsStatus ==
                  GetsurgerydetailsStatus.loading ||
              BlocProvider.of<GetsurgerydetailsCubit>(context).rr == null) {
            return CircularProgressIndicator(
              color: Colors.blue,
            );
          }
          Map details = BlocProvider.of<GetsurgerydetailsCubit>(context)
              .rr['patientSurgeryyyy'];
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 10, right: 0, top: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(65, 99, 142, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Patient other info',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "id:  ${details['patientotherInfos'][0]['id'].toString()}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Injury type:  ${details['patientotherInfos'][0]['injuryType']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Asa:  ${details['patientotherInfos'][0]['ASA']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color.fromRGBO(65, 99, 142, 1),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Surgery Situation:  ${details['patientotherInfos'][0]['surgerySituation']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Injury type:  ${details['patientotherInfos'][0]['injuryType']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Surgery Duration:  ${details['patientotherInfos'][0]['surgeryDuration']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color.fromRGBO(65, 99, 142, 1),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "antipathetic:  ${details['patientotherInfos'][0]['antipathetic'].toString()}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "antipathetic Start Date:  ${details['patientotherInfos'][0]['antipatheticStartDate'].toString()}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "anti pathetic StopDate:  ${details['patientotherInfos'][0]['antipatheticStopDate'].toString()}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color.fromRGBO(65, 99, 142, 1),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "surgery FileID:  ${details['patientotherInfos'][0]['surgeryFileID'].toString()}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Created_at:  ${details['patientotherInfos'][0]['created_at'].toString().substring(0, 10)}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "updated_at:  ${details['patientotherInfos'][0]['updated_at'].toString().substring(0, 10)}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(65, 99, 142, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Patient medical Crew Info',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Surgeon Name:  ${details['patientmedicalCrewInfos'][0]['surgeonName'].toString()}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "helper Surgeon Name:  ${details['patientmedicalCrewInfos'][0]['helperSurgeonName']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Nurse Name:  ${details['patientmedicalCrewInfos'][0]['nurseName']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color.fromRGBO(65, 99, 142, 1),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "surgeon Room Number:  ${details['patientmedicalCrewInfos'][0]['surgeonRoomNumber']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Surgery Name:  ${details['patientmedicalCrewInfos'][0]['surgeryName']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Helper Nurse:  ${details['patientmedicalCrewInfos'][0]['helperNurse']}",
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
