import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home_cubit.dart';
import '../../models/movie.dart';
import '../../models/person.dart';
import '../../services/tmdb_service.dart';
import '../../widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.blueAccent.shade700,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocProvider(
          create: (context) => TrendingCubit(TMDBService())..fetchTrending(),
          child: BlocBuilder<TrendingCubit, TrendingState>(
            builder: (context, state) {
              if (state is TrendingLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TrendingLoaded) {
                final movies = state.trendingData['movies'] as List<Movie>;
                final people = state.trendingData['people'] as List<Person>; // Assuming you have a people list

                return SingleChildScrollView( // Enable scrolling
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            'Movies',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return Container(
                                width: 150,
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: movie.posterPath.isNotEmpty
                                          ? Image.network(
                                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                        fit: BoxFit.cover,
                                      )
                                          : Container(
                                        color: Colors.grey,
                                        child: const Center(child: Text('No Image')),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        movie.title,
                                        style: const TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20), // Space between movies and people sections
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'People',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250, // Adjust height as needed
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: people.length,
                            itemBuilder: (context, index) {
                              final person = people[index];
                              return Container(
                                width: 150,
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: person.profilePath.isNotEmpty
                                          ? Image.network(
                                        'https://image.tmdb.org/t/p/w500${person.profilePath}',
                                        fit: BoxFit.cover,
                                      )
                                          : Container(
                                        color: Colors.grey,
                                        child: const Center(child: Text('No Image')),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        person.name, // Assuming Person model has a name field
                                        style: const TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is TrendingError) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              }
              return Container();
            },
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
