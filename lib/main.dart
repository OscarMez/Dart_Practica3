import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/providers/dogs_provider.dart';
import 'package:movies_app/models/dog_breeds_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DogsProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dog Breeds App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Razas de Perros'),
          ),
          body: DogBreedsList(),
        ),
      ),
    );
  }
}


