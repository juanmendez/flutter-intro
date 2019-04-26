import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intro_to_flutter/data/dog_model.dart';
import 'package:intro_to_flutter/data/dog_service.dart';
import 'package:intro_to_flutter/ui/block/dog_event.dart';

class DogBloc extends Bloc<DogEvent, List<Dog>> {
  @override
  List<Dog> get initialState => List();

  @override
  Stream<List<Dog>> mapEventToState(DogEvent event) async* {
    if (event is PullDogsEvent) {
      var dogs = await getDogBreeds();
      yield dogs;
    }
  }
}
