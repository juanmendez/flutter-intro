import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_flutter/data/dog_model.dart';
import 'package:intro_to_flutter/ui/block/dog_bloc.dart';
import 'package:intro_to_flutter/ui/block/dog_event.dart';
import 'package:intro_to_flutter/ui/dog_card.dart';

class DogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ///~ recyclerview
  Widget _buildList(context) {
    final DogBloc _bloc = BlocProvider.of<DogBloc>(context);

    return BlocBuilder<DogEvent, List<Dog>>(
      bloc: _bloc,
      builder: (BuildContext context, List<Dog> dogs) {
        return ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, pos) {
              /// if it were a heterogenous list then
              /// here we will set conditions to load different view types
              return DogCard(dogs[pos]);
            });
      },
    );
  }
}
