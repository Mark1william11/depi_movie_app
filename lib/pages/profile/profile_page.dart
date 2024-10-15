import 'package:depi_movie_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final AuthService authService = AuthService();

  ProfilePage({super.key});

  void logout(BuildContext context) async {
    // Show a confirmation dialog before logging out
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              await authService.logout(); // Call logout function and wait for it to finish

              // Check if the user is logged out
              if (FirebaseAuth.instance.currentUser == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Successfully logged out')),
                );

                // Optional: Navigate to the login page after logout
                // Uncomment the following line to navigate
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout failed')),
                );
              }
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile picture
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/img1.jpg'), // Change to your image path
              ),
            ),
            const SizedBox(height: 16),
            // User name
            const Center(
              child: Text(
                'Username', // Replace with actual username
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            // User email
            const Center(
              child: Text(
                'user@example.com', // Replace with actual email
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),

            // Edit Profile Card
            Card(
              color: Colors.black54,
              child: ListTile(
                leading: const Icon(Icons.edit, color: Colors.white),
                title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle edit profile action
                },
              ),
            ),
            const SizedBox(height: 8),

            // Settings Card
            Card(
              color: Colors.black54,
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle settings action
                },
              ),
            ),
            const SizedBox(height: 8),

            // Logout Card
            Card(
              color: Colors.black54,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () => logout(context), // Call the logout function with context
              ),
            ),
          ],
        ),
      ),
    );
  }
}
