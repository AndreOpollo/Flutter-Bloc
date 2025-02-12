import 'package:bloc_test/bloc/item_bloc.dart';
import 'package:bloc_test/bloc/item_events.dart';
import 'package:bloc_test/bloc/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void refresh(BuildContext context) {
    context.read<ItemBloc>().add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => refresh(context), child: Text("Refresh")),
          Expanded(child:
              BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
            if (state is ItemLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ItemLoaded) {
              return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.items[index].title),
                      subtitle: Text(state.items[index].completed.toString()),
                    );
                  });
            } else if (state is ItemError) {
              return Center(child: Text(state.message));
            }
            return Center(
              child: Text("No list items"),
            );
          }))
        ],
      ),
    );
  }
}
