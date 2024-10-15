import 'package:dio/dio.dart';
import '../models/movie.dart';
import '../models/person.dart';

class TMDBService {
  final Dio _dio;

  TMDBService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODgxYTNjZDA1YmNkZTJhY2QxMTQzNTc2NTZjMTk4YSIsIm5iZiI6MTcyODk5MDQ0Ny43NjY0MzYsInN1YiI6IjY3MGFmZGMwM2JiNDU1N2M2NjliNDhhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UOtWsY-QQ5muJfPD2rr7j8q7a7Kk8Ti0Y39ikATOjEk',
            'Accept': 'application/json',
          },
        ));

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await _dio.get('/trending/movie/day', queryParameters: {
        'language': 'en-US',
      });

      // Log the complete response data
      print('Movies Response: ${response.data}');

      if (response.data['results'] is List) {
        List<dynamic> data = response.data['results'];
        return data.map<Movie>((movie) => Movie.fromJson(movie as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      print('Error fetching trending movies: $e');
      rethrow;
    }
  }


  Future<List<Person>> getTrendingPeople() async {
    try {
      final response = await _dio.get('/trending/person/day', queryParameters: {
        'language': 'en-US',
      });
      print('People Response: ${response.data}'); // Debugging output

      if (response.data['results'] is List) {
        List<dynamic> data = response.data['results'];
        return data
            .map<Person>(
                (person) => Person.fromJson(person as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      print('Error fetching trending people: $e');
      rethrow;
    }
  }
}
