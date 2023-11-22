import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/dog_breeds_list.dart';
import 'dart:convert';
import 'package:movies_app/models/now_playing_response.dart';
import 'package:movies_app/models/dog_response.dart';

class DogsProvider with ChangeNotifier {
  final String _baseUrl = 'https://dog.ceo'; 

  List<DogBreedsList> dogList = [];

  DogsProvider() {
    print('Dogs Provider inicializado!');
    // Aquí puedes llamar a la función para cargar la lista de razas de perros
    this.getDogList();
  }

  get dogBreeds => null;

  Future<void> getDogList() async {
    var url = Uri.https(_baseUrl, '/api/breeds/list/all');

    final result = await http.get(url);

    if (result.statusCode == 200) {
      var jsonResponse = json.decode(result.body) as Map<String, dynamic>;

      final dogResponse = DogResponse.fromJson(jsonResponse as String);
      dogList = dogResponse.dogs!;
      notifyListeners();
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  getDogBreeds() {}
}

