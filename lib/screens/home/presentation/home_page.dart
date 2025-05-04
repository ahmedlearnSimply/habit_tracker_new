// home_page.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/home/presentation/home_screen.dart';
import 'package:habit_tracker/screens/home/widgets/showModelSheet.dart';
import 'package:habit_tracker/screens/insights/screens/insights_screen.dart';
import 'package:habit_tracker/screens/profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    InsightsScreen(habits: []),
    SettingsScreen(),
    // showAddHabitSheet(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'الاحصائيات'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'الملف الشخصي'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'الاعدادت'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'العادات'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddHabitSheet(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
