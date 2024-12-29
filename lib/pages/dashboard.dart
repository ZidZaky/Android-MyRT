import 'package:android_myrt/pages/addKartuKeluarga.dart';
import 'package:android_myrt/pages/allData.dart';
import 'package:android_myrt/pages/myProfile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // List of pages for each Bottom Navigation Bar item
  final List<Widget> _pages = [
    AllData(),
    AddKartuKeluarga(),
    MyProfile(),
  ];

  // Function to handle bottom navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Switches between pages
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Data KK",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Tambah Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Profile",
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}

// Dummy Page: List All Data
class ListAllDataPage extends StatelessWidget {
  const ListAllDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "List All Data Page",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}