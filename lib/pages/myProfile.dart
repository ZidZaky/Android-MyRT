import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center( // Ensures all content is centered horizontally and vertically
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjusts the Column to center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns items horizontally to the center
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with a valid image path
                onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 50),
              ),
              const SizedBox(height: 16),

              // ID
              Text(
                "ID: 123456",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
              ),

              const SizedBox(height: 8),

              // Username
              const Text(
                "Username: johndoe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),

              // Email
              const Text(
                "Email: johndoe@example.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // Change Password Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to Change Password Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy Change Password Page
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          "Change Password Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
