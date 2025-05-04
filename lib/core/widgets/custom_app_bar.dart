import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker/core/utils/assets.dart';
import 'package:habit_tracker/core/utils/colors.dart';
import 'package:habit_tracker/main.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final DateTime selectedDate = DateTime.now();
  // final void Function() onAddPressed;
  // final void Function()? onStatsPressed;
  // final void Function() onSettingsPressed;

  CustomAppBar({
    super.key,
    required this.userName,
    // required this.onAddPressed,
    // required this.onStatsPressed,
    // required this.onSettingsPressed,
  });

  String _getDayName(int day) {
    switch (day) {
      case 1:
        return 'الإثنين';
      case 2:
        return 'الثلاثاء';
      case 3:
        return 'الأربعاء';
      case 4:
        return 'الخميس';
      case 5:
        return 'الجمعة';
      case 6:
        return 'السبت';
      case 7:
        return 'الأحد';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 5,
        //     color: Colors.black.withValues(
        //       colorSpace: ColorSpace.displayP3,
        //     ),
        //     offset: const Offset(
        //       0,
        //       2,
        //     ),
        //   )
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          _buildGreeting(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getDayName(selectedDate.weekday),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'cairo',
                ),
              ),
              Text(
                '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'cairo',
                ),
              ),
            ],
          ),
          const Gap(6),
          _buildQuote(),
          // Action icons
          // _buildActionIcons(),
        ],
      ),
    );
  }

  // Row _buildActionIcons() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         decoration: const BoxDecoration(
  //           color: Colors.transparent,
  //           shape: BoxShape.circle,
  //         ),
  //         child: IconButton(
  //           icon: const Icon(
  //             Icons.bar_chart_outlined,
  //           ),
  //           iconSize: 28,
  //           color: AppColors.redColor,
  //           onPressed: onStatsPressed,
  //         ),
  //       ),
  //       Container(
  //         decoration: const BoxDecoration(
  //           color: Colors.green,
  //           shape: BoxShape.circle,
  //         ),
  //         child: IconButton(
  //           icon: const Icon(
  //             Icons.add_circle_outline,
  //           ),
  //           iconSize: 34,
  //           color: AppColors.primaryText,
  //           onPressed: onAddPressed,
  //         ),
  //       ),
  //       Container(
  //         decoration: const BoxDecoration(
  //           color: Colors.transparent,
  //           shape: BoxShape.circle,
  //         ),
  //         child: IconButton(
  //           icon: const Icon(Icons.settings_outlined),
  //           iconSize: 28,
  //           color: Colors.blueAccent,
  //           onPressed: onSettingsPressed,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Text _buildQuote() {
    return const Text(
      "كل عادة تترك أثرًا",
      style: TextStyle(
        fontSize: 16,
        color: Colors.white70,
        fontFamily: 'cairo',
      ),
    );
  }

  Row _buildGreeting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "أهلاً، $userName 👋",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Colors.white,
            fontFamily: 'cairo',
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            const Text(
              "اثر",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'cairo',
              ),
            ),
            const Gap(5),
            SvgPicture.asset(
              AppAssets.logoSvg,
              width: 36,
              height: 36,
            ),
          ],
        ),
      ],
    );
  }
}
