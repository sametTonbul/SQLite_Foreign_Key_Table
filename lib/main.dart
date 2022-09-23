import 'package:flutter/material.dart';
import 'package:flutter_sqlite_2/databaseaccess.dart';
import 'package:flutter_sqlite_2/movies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> show() async {
    var list = await moviesDatabaseAccessObject().allMovies();

    for (Movies index in list) {
      print('****************');
      print('Movies ID: ${index.movies_id}');
      print('Movies Name: ${index.movies_name}');
      print('Movies Director: ${index.director.director_name}');
      print('Movies Year: ${index.movies_year}');
      print('Movies Category: ${index.category.category_name}');
      print('Movies Picture: ${index.movies_picture}');
    }
  }

  @override
  void initState() {
    super.initState();
    show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
