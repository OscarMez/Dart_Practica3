import 'dart:convert';

import 'package:movies_app/models/dog_breeds_list.dart';

class DogResponse {
    Map<String, List<String>> message;
    String status;

    DogResponse({
        required this.message,
        required this.status,
    });

    factory DogResponse.fromJson(String str) => DogResponse.fromMap(json.decode(str));

  List<DogBreedsList>? get dogs => null;

    String toJson() => json.encode(toMap());

    factory DogResponse.fromMap(Map<String, dynamic> json) => DogResponse(
        message: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "message": Map.from(message).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
    };
}



