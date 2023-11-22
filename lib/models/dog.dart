import 'dart:convert';

class Dog {
  String breedName;
  List<dynamic> subBreeds;

  Dog({
    required this.breedName,
    required this.subBreeds,
  });

  factory Dog.fromRawJson(String str) => Dog.fromJson(json.decode(str));

  String get fullPosterPath {
    // TODO: implement fullPosterPath
    throw UnimplementedError();
  }

  String toRawJson() => json.encode(toJson());

  factory Dog.fromJson(Map<String, dynamic> json) {
    final subBreeds = json["subBreeds"] != null
        ? List<String>.from(json["subBreeds"].map((x) => x))
        : [];

    return Dog(
      breedName: json["breedName"],
      subBreeds: subBreeds,
    );
  }

  Map<String, dynamic> toJson() => {
        "breedName": breedName,
        "subBreeds": List<dynamic>.from(subBreeds.map((x) => x)),
      };
}



