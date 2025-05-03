import 'dart:ui';

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

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.onAddPressed,
    required this.onStatsPressed,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withValues(
              colorSpace: ColorSpace.displayP3,
            ),
            offset: const Offset(
              0,
              2,
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
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
          ),
          const Gap(6),
          const Text(
            "كل عادة تترك أثرًا",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.secondaryText,
              fontFamily: 'cairo',
            ),
          ),
          const Gap(24),
          // Action icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.bar_chart_outlined),
                  iconSize: 28,
                  color: AppColors.primaryText,
                  onPressed: onStatsPressed,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.amber,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  iconSize: 34,
                  color: AppColors.cardColor,
                  onPressed: onAddPressed,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.settings_outlined),
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
