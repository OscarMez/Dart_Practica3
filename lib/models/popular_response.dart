import 'models.dart';

class PopularDogResponse {
  int page;
  List<Dog> dogs;
  int totalPages;
  int totalResults;

  PopularDogResponse({
    required this.page,
    required this.dogs,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularDogResponse.fromJson(String str) =>
      PopularDogResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PopularDogResponse.fromMap(Map<String, dynamic> json) =>
      PopularDogResponse(
        page: json["page"],
        dogs: List<Dog>.from(json["results"].map((x) => Dog.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(dogs.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Dog {
  String breedName;
  List<dynamic> subBreeds;

  Dog({
    required this.breedName,
    required this.subBreeds,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    final subBreeds = json["subBreeds"] != null
        ? List<String>.from(json["subBreeds"].map((x) => x))
        : [];

    return Dog(
      breedName: json["breedName"],
      subBreeds: subBreeds,
    );
  }

  Map<String, dynamic> toMap() => {
        "breedName": breedName,
        "subBreeds": List<dynamic>.from(subBreeds.map((x) => x)),
      };
      
        static fromMap(x) {}
}

