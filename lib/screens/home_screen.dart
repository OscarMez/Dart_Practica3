import 'package:flutter/material.dart';
import 'package:movies_app/models/dog_breeds_list.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/providers/dogs_provider.dart';
import 'package:movies_app/models/dog.dart'; // Asegúrate de importar el modelo correcto
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dogsProvider = Provider.of<DogsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Razas de Perros'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Puedes implementar la funcionalidad de búsqueda aquí
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lista de Razas de Perros
              Text(
                'Lista de Razas de Perros:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Utilizamos el widget DogBreedsList para mostrar la lista de razas de perros
              DogBreedsList(),

              const SizedBox(height: 20),

              // Puedes agregar más widgets aquí según sea necesario
            ],
          ),
        ),
      ),
    );
  }
}

