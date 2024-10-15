import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Display the profile image
          Image.network(
            person.profilePath != null
                ? 'https://image.tmdb.org/t/p/w500${person.profilePath}'
                : 'https://via.placeholder.com/150', // Placeholder if no image
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              person.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
