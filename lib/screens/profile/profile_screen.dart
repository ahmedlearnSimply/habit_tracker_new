// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker/core/utils/colors.dart';
import 'package:habit_tracker/core/utils/textStyle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // 🌐 Open website
  Future<void> _launchWebsite() async {
    final Uri url = Uri.parse(
        'https://learrnsimply.com/%D9%83%D9%84-%D8%B9%D8%A7%D8%AF%D8%A9-%D8%AA%D8%AA%D8%B1%D9%83-%D8%A7%D8%AB%D8%B1/');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInstagram() async {
    final Uri url = Uri.parse('https://www.instagram.com/ahmed.aaddel');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendFeedback() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ahmedadel123422@gmail.com',
      query: 'subject=ملاحظات حول تطبيق تتبع العادات',
    );
    if (!await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $emailUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "الإعدادات",
          style: getTitleStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Gap(20),
            ListTile(
              onTap: _launchWebsite,
              leading: Icon(Icons.language, color: Colors.white),
              title: Text(
                "زيارة موقعنا",
                style: getBodyStyle(),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
            ),
            Divider(color: Colors.white24),
            ListTile(
              onTap: _launchInstagram,
              leading: Icon(Icons.camera_alt, color: Colors.white),
              title: Text(
                "تابعنا على انستجرام",
                style: getBodyStyle(),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
            ),
            Divider(color: Colors.white24),
            ListTile(
              onTap: _sendFeedback,
              leading: Icon(Icons.email, color: Colors.white),
              title: Text(
                "إرسال ملاحظات",
                style: getBodyStyle(),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
            ),
            Divider(color: Colors.white24),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Made with ☕ and ❤️ by Ahmed Adel",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
