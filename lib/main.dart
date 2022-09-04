import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/app_cubit_logic.dart';
import 'package:notes/cubits/app_cubits.dart';
import 'package:notes/pages/details_page.dart';
import 'package:notes/pages/nav/main_page.dart';
import 'package:notes/pages/welcome.dart';
import 'package:notes/services/data-services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        // ignore: prefer_const_constructors
        // home: Welcome()
        // home: MainPage(),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: AppCubitLogic(),
        ));
  }
}
