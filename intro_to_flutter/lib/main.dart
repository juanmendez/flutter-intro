import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_flutter/ui/block/dog_bloc.dart';
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
    _bloc.dispatch(PullDogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: BlocProvider<DogBloc>(
          bloc: _bloc,
          child: DogList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
