import 'package:flutter/material.dart';
import 'package:trumsy/blocs/bloc.dart';
import 'package:trumsy/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trumsy Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TasksBloc(),
        child: const HomePage(),
      ),
    );
  }
}
