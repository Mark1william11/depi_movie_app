import 'package:flutter/material.dart';
import '../../main.dart'; // Import the GradientBackground

class DiscoverPage extends StatelessWidget {
  final List<String> categories = [
    'Action', 'Drama', 'Comedy', 'Horror', 'Romance', 'Sci-Fi', 'Thriller', 'Animation', 'Documentary'
  ];

  DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Discover'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // TODO: Implement category navigation
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text(
                  categories[index],
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
