import 'dart:convert';

class Kost {
    int id;
    String name;
    String address;
    String price;
    int facility;
    int roomSize;
    String rating;
    DateTime createdAt;
    DateTime updatedAt;

    Kost({
        required this.id,
        required this.name,
        required this.address,
        required this.price,
        required this.facility,
        required this.roomSize,
        required this.rating,
        required this.createdAt,
        required this.updatedAt,
    });

    // factory Kost.fromRawJson(String str) => Kost.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Kost.fromJson(Map<String, dynamic> json) => Kost(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        price: json["price"],
        facility: json["facility"],
        roomSize: json["room_size"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "price": price,
        "facility": facility,
        "room_size": roomSize,
        "rating": rating,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
