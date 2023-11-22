import 'package:flutter/material.dart';
import 'package:movies_app/providers/dogs_provider.dart';
import 'package:provider/provider.dart';

class DogBreedsList extends StatelessWidget {
  get breedName => null;

  get description => null;

  @override
  Widget build(BuildContext context) {
    final dogsProvider = Provider.of<DogsProvider>(context, listen: false);

    return FutureBuilder(
      future: dogsProvider.getDogBreeds(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Renderizar la lista de razas de perros
          return ListView.builder(
            itemCount: dogsProvider.dogBreeds.length,
            itemBuilder: (BuildContext context, int index) {
              final breed = dogsProvider.dogBreeds[index];
              return ListTile(
                title: Text(breed.breedName),
                subtitle: breed.subBreeds.isNotEmpty
                    ? Text('Subrazas: ${breed.subBreeds.join(', ')}')
                    : null,
              );
            },
          );
        }
      },
    );
  }
}

