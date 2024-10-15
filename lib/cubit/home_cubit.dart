import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/tmdb_service.dart';

// Define the states
abstract class TrendingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final Map<String, List<dynamic>> trendingData;

  TrendingLoaded(this.trendingData);

  @override
  List<Object?> get props => [trendingData];
}

class TrendingError extends TrendingState {
  final String errorMessage;

  TrendingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

// Define the Cubit
class TrendingCubit extends Cubit<TrendingState> {
  final TMDBService tmdbService;

  TrendingCubit(this.tmdbService) : super(TrendingInitial());

  Future<void> fetchTrending() async {
    emit(TrendingLoading());
    try {
      final movies = await tmdbService.getTrendingMovies();
      final people = await tmdbService.getTrendingPeople();
      emit(TrendingLoaded({
        'movies': movies,
        'people': people,
      }));
    } catch (e) {
      emit(TrendingError(e.toString()));
    }
  }

}
