import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/data/repo/floor_repo.dart';
import 'package:waseem/shared/sharedComponent/constant.dart';

import '../../Models/room_model.dart';

part 'floor_state.dart';

class FloorCubit extends Cubit<FloorState> {
  FloorCubit() : super(FloorState.initial());

  static FloorCubit get(context) => BlocProvider.of(context);

  var room ;

  Future getFloors() async {
    emit(state.copyWith(status: RequestState.loading));
    try {
      print("ddddd");

      List<dynamic> result = await FloorRepo.getFloor();
      final List<Room> rooms = List.from(result.map(
        (e) => Room.fromJson(e),
      ));
      // Group rooms by floorID
      Map<int, List<Room>> floorMap = {};
      for (Room room in rooms) {
        if (!floorMap.containsKey(room.floorID)) {
          floorMap[room.floorID] = [];
        }
        floorMap[room.floorID]!.add(room);
      }
      // Create list of Floor objects
      List<Floor> floors = floorMap.entries
          .map((entry) => Floor(floorID: entry.key, rooms: entry.value))
          .toList();

      emit(
        state.copyWith(
          status: RequestState.success,
          rooms: rooms,
          floors: floors,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: RequestState.error));
    }
  }

  Future getRoom( int floorID) async {
    emit(state.copyWith(status: RequestState.loading));
    try {
      print("ddddd");
      room =await FloorRepo.getRoom(floorID) ;
      emit(
        state.copyWith(
          status: RequestState.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: RequestState.error));
    }
  }
}
