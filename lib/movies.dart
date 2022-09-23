import 'package:flutter_sqlite_2/categories.dart';
import 'package:flutter_sqlite_2/directors.dart';

class Movies {
  int? movies_id;
  String? movies_name;
  int? movies_year;
  String? movies_picture;
  Categories category;
  Directors director;

  Movies(this.movies_id, this.movies_name, this.movies_year,
      this.movies_picture, this.category, this.director);
}
