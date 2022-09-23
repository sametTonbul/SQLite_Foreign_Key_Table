import 'package:flutter_sqlite_2/categories.dart';
import 'package:flutter_sqlite_2/dataBaseHelper.dart';
import 'package:flutter_sqlite_2/directors.dart';
import 'package:flutter_sqlite_2/movies.dart';

class moviesDatabaseAccessObject {
  Future<List<Movies>> allMovies() async {
    var allMoviesDatabaseAO = await DatabaseHelper.accessDatabase();
    List<
        Map<String,
            dynamic>> allMoviesMap = await allMoviesDatabaseAO.rawQuery(
        "SELECT * FROM movies,categories,directors WHERE movies.category_id = categories.category_id and movies.director_id = directors.director_id");
    return List.generate(allMoviesMap.length, (index) {
      var allMoviesRow = allMoviesMap[index];
      var allMoviesCategory = Categories(
          allMoviesRow['category_id'], allMoviesRow['category_name']);
      var allMoviesDirectory =
          Directors(allMoviesRow['director_id'], allMoviesRow['director_name']);
      var allMoviesToMovies = Movies(
        allMoviesRow['movies_id'],
        allMoviesRow['movies_name'],
        allMoviesRow['movies_year'],
        allMoviesRow['movies_pictures'],
        allMoviesCategory,
        allMoviesDirectory,
      );

      return allMoviesToMovies;
    });
  }
}
