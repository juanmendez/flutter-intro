import 'package:flutter/cupertino.dart';
import 'package:intro_to_flutter/data/dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  State<StatefulWidget> createState() {
    return _DogCardState(dog);
  }

}

class _DogCardState extends State<DogCard> {
  Dog dog;

  // interesting, this State requires the same params in the constructor
  // as its counterpart's constructor
  _DogCardState(dog);

  @override
  Widget build(BuildContext context) {
    return Text(widget.dog.name);
  }
}