import 'package:flutter/material.dart';
import 'package:movies_app/models/dog_breeds_list.dart';  // Asegúrate de importar el modelo correcto
import 'package:movies_app/providers/dogs_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DogsProvider dogsProvider = Provider.of<DogsProvider>(context);
    final DogBreedsList dogBreed =
        ModalRoute.of(context)?.settings.arguments as DogBreedsList;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(dogBreed: dogBreed),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(dogBreed: dogBreed),
                _Overview(dogBreed: dogBreed),
                // Puedes adaptar esta parte según lo necesario para la API de perros
                // CastingCards(peli.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final DogBreedsList dogBreed;

  const _CustomAppBar({Key? key, required this.dogBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            dogBreed.breedName,  // Ajusta según la estructura de tu modelo de perros
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: Placeholder(),  // Reemplaza con la imagen correcta de perros
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final DogBreedsList dogBreed;

  const _PosterAndTitle({Key? key, required this.dogBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Puedes adaptar esto según la API de perros
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Placeholder(),  // Reemplaza con la imagen correcta de perros
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                dogBreed.breedName,  // Ajusta según la estructura de tu modelo de perros
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              // Puedes agregar más detalles según la API de perros
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final DogBreedsList dogBreed;

  const _Overview({Key? key, required this.dogBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Puedes adaptar esto según la API de perros
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Descripción: ${dogBreed.description}',  // Ajusta según la estructura de tu modelo de perros
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

