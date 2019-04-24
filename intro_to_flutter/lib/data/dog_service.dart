import 'dart:convert';
import 'dart:io';

Stream<String> getRandomImage() async* {
  // This is how http calls are done in flutter:
  HttpClient http = HttpClient();
  try {
    // Use darts Uri builder
    var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    // The dog.ceo API returns a JSON object with a property
    // called 'message', which actually is the URL.
    yield json.decode(responseBody)['message'];
  } catch (exception) {
    print(exception);
  }
}