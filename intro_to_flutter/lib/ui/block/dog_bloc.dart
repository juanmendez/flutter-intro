import 'dart:async';

import 'package:intro_to_flutter/data/dog_model.dart';
import 'package:intro_to_flutter/data/dog_service.dart';
import 'package:intro_to_flutter/ui/block/dog_event.dart';

class DogBloc {
  /**
   * In Android we create a MutableLiveData which is private and used within
   * a ViewModel in order to emit updates.
   * Then we provide a non-mutable LiveData for others to listen
   *
   * In Dart we use StreamController to do the same. Except here we
   * make use of sink to add events to the StreamController.
   * And we use stream to listen for state updates.
   *
   * see https://www.youtube.com/watch?v=oxeYeMHVLII
   */
  final _stateController = StreamController<List<Dog>>();

  StreamSink<List<Dog>> get _stateSink => _stateController.sink;

  Stream<List<Dog>> get stateStream => _stateController.stream;

  final _eventController = StreamController<DogEvent>();

  Stream<DogEvent> get _eventStream => _eventController.stream;

  Sink<DogEvent> get eventSink => _eventController.sink;

  DogBloc() {
    _eventStream.listen(_eventHandler);
  }

  void _eventHandler(DogEvent event) {
    if (event is PullDogsEvent) {
      getDogBreeds().then((dogs) {
        _stateSink.add(dogs);
      });
    }
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
