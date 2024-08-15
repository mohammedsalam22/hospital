class Room {
  int id;
  int roomNumber;
  String status;
  int floorID;
  DateTime createdAt;
  DateTime updatedAt;

  Room({
    required this.id,
    required this.roomNumber,
    required this.status,
    required this.floorID,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isAvailable => status == "available";
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomNumber: json['roomNumber'],
      status: json['status'],
      floorID: json['floorID'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Floor {
  int floorID;
  List<Room> rooms;

  Floor({
    required this.floorID,
    required this.rooms,
  });
}
