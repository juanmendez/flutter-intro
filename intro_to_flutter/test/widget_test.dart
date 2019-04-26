// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:intro_to_flutter/data/dog_service.dart';
import 'package:intro_to_flutter/ui/block/dog_bloc.dart';
import 'package:intro_to_flutter/ui/block/dog_event.dart';
import 'package:test/test.dart';

void main() {
  test("ensure image is returned", () async {
    getRandomImage().listen((String url) {
      assert(url.isNotEmpty);
    });
  });

  test("ensure we get list of dogs", () async {
    getDogBreeds().then((dogs) {
      assert(dogs.isNotEmpty);
    });
  });

  test("ensure we can obtain an image", () {
    getImageByBreed("hound").then((image) {
      assert(image.isNotEmpty);
    });
  });
}
