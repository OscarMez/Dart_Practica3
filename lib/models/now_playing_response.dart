import 'models.dart';

class DogListResponse {
  List<Dog> dogs;

  DogListResponse({required this.dogs});

  factory DogListResponse.fromRawJson(String str) =>
      DogListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogListResponse.fromJson(Map<String, dynamic> json) => DogListResponse(
        dogs: List<Dog>.from(json["results"].map((x) => Dog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dogs": List<dynamic>.from(dogs.map((x) => x.toJson())),
      };
}

class Dog {
  String breedName;
  String subBreed;
  String imageUrl;

  Dog({
    required this.breedName,
    required this.subBreed,
    required this.imageUrl,
  });

  factory Dog.fromRawJson(String str) => Dog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        breedName: json["breedName"],
        subBreed: json["subBreed"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "breedName": breedName,
        "subBreed": subBreed,
        "imageUrl": imageUrl,
      };
}
