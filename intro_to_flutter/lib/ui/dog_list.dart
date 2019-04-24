import 'package:flutter/cupertino.dart';
import 'package:intro_to_flutter/data/dog_model.dart';
import 'package:intro_to_flutter/ui/dog_card.dart';

class DogList extends StatelessWidget {
  final List<Dog> dogs;
  DogList(this.dogs);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ///~ recyclerview
  ListView _buildList(context) {
    return ListView.builder(
      itemCount: dogs.length,
        itemBuilder: (context, pos) {
           /// decision point to load heterogeneous items
           return DogCard(dogs[pos]);
        });
  }
}
