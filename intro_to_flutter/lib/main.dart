import 'package:flutter/material.dart';
import 'package:intro_to_flutter/data/dog_model.dart';
import 'package:intro_to_flutter/data/dog_service.dart';
import 'package:intro_to_flutter/ui/block/dog_block.dart';
import 'package:intro_to_flutter/ui/block/dog_event.dart';
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
  final _bloc = DogBloc();


  @override
  void initState() {
    super.initState();
    _bloc.eventSink.add(PullDogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: StreamBuilder(
            stream: _bloc.stateStream,
            initialData: List<Dog>(),
            builder: (
          BuildContext context,
          AsyncSnapshot<List<Dog>> snapshot,
        ) {
          return DogList(snapshot.data);
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
