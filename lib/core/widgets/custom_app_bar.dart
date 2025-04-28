// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker/core/utils/assets.dart';
import 'package:habit_tracker/core/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final void Function() onAddPressed;
  final void Function()? onStatsPressed;
  final void Function() onSettingsPressed;

  CustomAppBar({
    super.key,
    required this.userName,
    required this.onAddPressed,
    required this.onStatsPressed,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "أهلاً، $userName 👋",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'cairo',
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    "اثر",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'cairo',
                    ),
                  ),
                  Gap(5),
                  SvgPicture.asset(
                    AppAssets.logoSvg,
                    width: 36,
                    height: 36,
                  ),
                ],
              ),
            ],
          ),
          Gap(6),
          Text(
            "كل عادة تترك أثرًا",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.secondaryText,
              fontFamily: 'cairo',
            ),
          ),
          Gap(24),
          // Action icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.bar_chart_outlined),
                  iconSize: 28,
                  color: AppColors.primaryText,
                  onPressed: onStatsPressed,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryText.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  iconSize: 34,
                  color: AppColors.primaryText,
                  onPressed: onAddPressed,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.settings_outlined),
                  iconSize: 28,
                  color: AppColors.primaryText,
                  onPressed: onSettingsPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
