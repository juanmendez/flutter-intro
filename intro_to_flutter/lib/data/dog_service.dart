import 'dart:convert';
import 'dart:io';

import 'package:intro_to_flutter/data/dog_model.dart';

Stream<String> getRandomImage() async* {
  // This is how http calls are done in flutter:
  HttpClient http = HttpClient();
  try {
    var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    yield json.decode(responseBody)['message'];
  } catch (exception) {
    print(exception);
  }
}

Future<String> getImageByBreed(String breedName) async {
  HttpClient http = HttpClient();

  try {
    var uri = Uri.http('dog.ceo', '/api/breed/${breedName}/images/random/1');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response;

    return responseBody.transform(utf8.decoder).join().then((responseBody){
      var body = json.decode(responseBody);
      var images = body["message"];
      return images.first ?? "";
    });
  } catch (exception) {
    print(exception);
  }
}

Future<List<Dog>> getDogBreeds() async {
  HttpClient http = HttpClient();

  try {
    var uri = Uri.http('dog.ceo', '/api/breeds/list');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    var body = json.decode(responseBody);
    List list = body["message"];
    list = list.sublist(0, 10);

    return Future<List<Dog>>(() async {
      var dogs = List<Dog>();
      for (var value in list) {
        var dog = Dog(value, "location", "description");
        dog.imageUrl =  await getImageByBreed(value);
        dogs.add(dog);
      }

      return dogs;
    });
  } catch (exception) {
    print(exception);
  }
}
