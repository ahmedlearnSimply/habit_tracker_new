// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker/core/utils/colors.dart';
import 'package:habit_tracker/core/utils/text_style.dart';
import 'package:habit_tracker/screens/habit/habit_card.dart';
import 'package:habit_tracker/screens/home/model/habit_model.dart';

class InsightsScreen extends StatefulWidget {
  final List<HabitModel> habits;

  InsightsScreen({
    required this.habits,
    super.key,
  });

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  int index = 0;

  Widget build(BuildContext context) {
    final completedDates = widget.habits[index].completedDateSet.toList();
    int currentStreak = calculateCurrentStreak(completedDates);
    int longestStreak = calculateLongestStreak(completedDates);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cardColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.habits.map((habit) {
                            bool isSelected = habit == widget.habits[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  index = widget.habits.indexOf(habit);
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(microseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Color(habit.colorValue)
                                      : Color(habit.colorValue)
                                          .withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                  border: isSelected
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null,
                                ),
                                child: Icon(
                                  IconData(habit.iconCodePoint,
                                      fontFamily: 'MaterialIcons'),
                                  color: isSelected
                                      ? Colors.white
                                      : Color(habit.colorValue),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            color: widget.habits[index].color,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    widget.habits[index].color.withOpacity(0.4),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
                            ]),
                        child: Center(
                          child: Text(
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            "تم",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30),
                _buildHabitInfo(widget: widget, index: index),
                Gap(20),
                //!year selector
                //? habit card
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: _buildGrid(
                        widget.habits[index].completedDateSet.toList(),
                        Color(widget.habits[index].colorValue),
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: 45,
                              height: 45,
                              decoration: circleIconDecoration(
                                  Color(widget.habits[index].colorValue)),
                              child: Icon(
                                Icons.star,
                                size: 28,
                                color: Color(
                                  widget.habits[index].colorValue,
                                ),
                              ),
                            ),
                            Gap(10),
                            Text(
                              "عدد الاتمامات",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            )
                          ],
                        ),
                        Gap(15),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 60,
                          height: 60,
                          decoration: circleIconDecoration(
                              Color(widget.habits[index].colorValue)),
                          child: Center(
                            child: Text(
                              "${widget.habits[index].completedDates.length}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.1)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "السلسلة الحالية",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Gap(16),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: 60,
                                height: 60,
                                decoration: circleIconDecoration(
                                    Color(widget.habits[index].colorValue)),
                                child: Center(
                                  child: Text(
                                    "$currentStreak",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Gap(12),
                    Expanded(
                      child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.1)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "افضل سلسلة",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Gap(16),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: 60,
                                height: 60,
                                decoration: circleIconDecoration(
                                    Color(widget.habits[index].colorValue)),
                                child: Center(
                                  child: Text(
                                    "$longestStreak",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int calculateCurrentStreak(List<DateTime> completedDates) {
    if (completedDates.isEmpty) return 0;

    // Sort dates descending
    completedDates.sort((a, b) => b.compareTo(a));

    DateTime today = DateTime.now();
    int streak = 0;

    for (DateTime date in completedDates) {
      if (isSameDay(today.subtract(Duration(days: streak)), date)) {
        streak++;
      } else {
        break;
      }
    }

    return streak;
  }

  int calculateLongestStreak(List<DateTime> completedDates) {
    if (completedDates.isEmpty) return 0;

    // Sort dates ascending
    completedDates.sort((a, b) => a.compareTo(b));

    int longest = 1;
    int current = 1;

    for (int i = 1; i < completedDates.length; i++) {
      if (isSameDay(
          completedDates[i - 1].add(Duration(days: 1)), completedDates[i])) {
        current++;
        if (current > longest) longest = current;
      } else {
        current = 1;
      }
    }

    return longest;
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Widget _buildGrid(List<DateTime> completedDates, Color color) {
    final DateTime today = DateTime.now();
    final DateTime startOfYear = DateTime(today.year, 1, 1);
    final DateTime endDate = today.add(Duration(days: 0)); // Up to today only

    final int totalDays = endDate.difference(startOfYear).inDays + 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate rows and columns based on container height/width
        const double spacing = 4;
        const int rows = 12; // For example, fixed number of rows

        double dotSize = 15; // dynamic size
        int columns = 6;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            textDirection: TextDirection.ltr,
            spacing: spacing,
            runSpacing: spacing,
            direction: Axis.vertical,
            children: List.generate(totalDays, (index) {
              final day = startOfYear.add(Duration(days: index));
              final isCompleted = completedDates.any((d) =>
                  d.year == day.year &&
                  d.month == day.month &&
                  d.day == day.day);

              return Container(
                width: dotSize,
                height: dotSize + 1,
                decoration: BoxDecoration(
                  color: isCompleted ? color : color.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class _buildHabitInfo extends StatelessWidget {
  const _buildHabitInfo({
    super.key,
    required this.widget,
    required this.index,
  });

  final InsightsScreen widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 50,
              height: 50,
              decoration:
                  circleIconDecoration(Color(widget.habits[index].colorValue)),
              child: Icon(
                IconData(widget.habits[index].iconCodePoint,
                    fontFamily: 'MaterialIcons'),
                color: Color(widget.habits[index].colorValue),
                size: 30,
              ),
            ),
            Gap(12),
            Flexible(
              child: Text(
                widget.habits[index].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration circleIconDecoration(Color color) {
  return BoxDecoration(
    color: color.withOpacity(0.15),
    shape: BoxShape.circle,
  );
}
