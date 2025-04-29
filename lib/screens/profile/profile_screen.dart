// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker/core/utils/colors.dart';
import 'package:habit_tracker/core/utils/textStyle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // 🌐 Open website
  void _launchWebsite() async {
    final url = Uri.parse('https://learrnsimply.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  // 📸 Open Instagram
  void _launchInstagram() async {
    final url = Uri.parse('https://www.instagram.com/ahmed.aaddel');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  // ✉️ Send feedback email
  void _sendFeedback() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ahmedadel123422@gmail.com',
      query: 'subject=ملاحظات حول تطبيق تتبع العادات',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("صنع مزيد من الحب والقهوة من احمد عادل"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
