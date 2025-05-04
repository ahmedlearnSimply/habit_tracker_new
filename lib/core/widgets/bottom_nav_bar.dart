import 'package:flutter/material.dart';

class FloatingBottomNavBarDemo extends StatefulWidget {
  @override
  _FloatingBottomNavBarDemoState createState() =>
      _FloatingBottomNavBarDemoState();
}

class _FloatingBottomNavBarDemoState extends State<FloatingBottomNavBarDemo> {
  int selectedIndex = 0;

  final List<String> pages = ['Add Habit', 'Statistics', 'Settings'];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Text(
          'Current Page: ${pages[selectedIndex]}',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavBarItem(Icons.add, 0),
            buildNavBarItem(Icons.bar_chart, 1),
            buildNavBarItem(Icons.settings, 2),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}
