import 'package:flutter/material.dart';
import '../../models/movie.dart';
import '../../models/person.dart';
import '../../widgets/movie_card.dart';
import '../../widgets/person_card.dart';

class HomeContent extends StatelessWidget {
  final List<Movie> movies;
  final List<Person> people;

  const HomeContent({
    super.key,
    required this.movies,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: screenSize.height + 230),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Movies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 500,
              child: movies.isNotEmpty // Check if the movies list is not empty
                  ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: MovieCard(movie: movies[index]),
                ),
              )
                  : const Center(child: Text('No movies available')), // Display message if empty
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            const Text(
              "People",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 400,
              child: people.isNotEmpty // Check if the people list is not empty
                  ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: PersonCard(person: people[index]),
                ),
              )
                  : const Center(child: Text('No people available')), // Display message if empty
            ),
          ],
        ),
      ),
    );
  }
}
