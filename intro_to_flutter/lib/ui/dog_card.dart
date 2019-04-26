import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  /// interesting, this State requires the same params in the constructor
  /// as its counterpart's constructor
  _DogCardState(dog);

  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.dog.imageUrl ?? ""),
        ),
      ),
    );
  }

  Widget get dogCard {
    return Container(
        width: 290.0,

        /// can't wait for match_parent
        height: 115.0,

        /// can't wait for wrap_content
        child: Card(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 64.0,
              ),
              child: Column(
                /// ~linearlayout-vertical_orientation
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.dog.name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Row(
                    /// ~linearLayout-horizontal-orientation
                    children: <Widget>[
                      Icon(Icons.star),
                      Text(": ${widget.dog.rating} / 10"),
                    ],
                  )
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    /// tried only dog.name but it failed
    return Container(
      height: 115.0,
      child: Stack( /// ~frameLayout
        children: <Widget>[
          Positioned(
            left: 50.0,
            child: dogCard,
          ),
          Positioned(
            top: 7.5,
            child: dogImage,
          )
        ],
      ),
    );
  }
}
