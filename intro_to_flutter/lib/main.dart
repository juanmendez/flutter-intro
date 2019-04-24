import 'package:flutter/material.dart';
import 'package:intro_to_flutter/data/dog_model.dart';
import 'package:intro_to_flutter/data/dog_service.dart';
import 'package:intro_to_flutter/ui/dog_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Gallery',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'Pet Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> dogs = [];

  @override
  void initState() {
    super.initState();

    getDogBreeds().then((list) {
      setState(() {
        dogs = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(child: DogList(dogs)),
    );
  }
}
