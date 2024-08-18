part of 'floor_cubit.dart';

class FloorState extends Equatable {
  final RequestState status;
  final List<Room> rooms;
  final List<Floor> floors;
  const FloorState({
    required this.status,
    required this.rooms,
    required this.floors,
  });

  factory FloorState.initial() => const FloorState(
        status: RequestState.initial,
        rooms: [],
        floors: [],
      );
  FloorState copyWith({
    final RequestState? status,

    
    final List<Room>? rooms,
    final List<Floor>? floors,
  }) {
    return FloorState(
      status: status ?? this.status,
      rooms: rooms ?? this.rooms,
      floors: floors ?? this.floors,
    );
  }

  @override
  List<Object?> get props => [status, rooms, floors];
}
