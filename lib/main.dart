import 'package:bloc_test/bloc/item_bloc.dart';
import 'package:bloc_test/data/api/api_service.dart';
import 'package:bloc_test/data/repository/item_repository.dart';
import 'package:bloc_test/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc(ItemRepository(apiService: ApiService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
