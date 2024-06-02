import 'dart:convert';

class SetKriteria {
    int id;
    String k1;
    String k2;
    String k3;
    String k4;
    String k5;
    DateTime? createdAt;
    DateTime? updatedAt;

    SetKriteria({
        required this.id,
        required this.k1,
        required this.k2,
        required this.k3,
        required this.k4,
        required this.k5,
         this.createdAt,
         this.updatedAt,
    });

    // factory SetKriteria.fromRawJson(String str) => SetKriteria.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory SetKriteria.fromJson(Map<String, dynamic> json) => SetKriteria(
        id: json["id"],
        k1: json["k1"],
        k2: json["k2"],
        k3: json["k3"],
        k4: json["k4"],
        k5: json["k5"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "k1": k1,
        "k2": k2,
        "k3": k3,
        "k4": k4,
        "k5": k5,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
