import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
        backgroundColor: context.colors.backgroundSubtle,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.space.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.space.space_200,
            ),
            Text(
              "Data Privacy and Protection",
              style: context.typography.h3,
            ),
            SizedBox(
              height: context.space.space_100,
            ),
            Text(
              textAlign: TextAlign.justify,
              "At Laundrybin, we take your privacy seriously and are committed to protecting your personal information. Any data collected, such as your name, contact details, and laundry preferences, is used solely for the purpose of providing our laundry services and improving your customer experience. We do not share your information with third parties unless required by law or with your explicit consent. Our website may use cookies to enhance your browsing experience, but these do not collect personally identifiable information. We employ industry-standard security measures to safeguard your data against unauthorized access, alteration, or disclosure. By using our services, you consent to the collection and use of your information as outlined in this privacy policy.",
              style: context.typography.bodySemiBold,
            ),
            SizedBox(
              height: context.space.space_400,
            ),
            Text(
              "Information Collection and Usage",
              style: context.typography.h3,
            ),
            SizedBox(
              height: context.space.space_100,
            ),
            Text(
              textAlign: TextAlign.justify,
              "At [Laundry Shop Name], we collect personal information from you when you use our services or interact with our website. This information may include your name, contact details, payment information, and preferences. We use this information to provide and improve our laundry services, personalize your experience, and communicate with you about your orders. Rest assured, we never sell or share your information with third parties for marketing purposes without your consent. Your privacy and security are our top priorities.",
              style: context.typography.bodySemiBold,
            )
          ],
        ),
      ),
    );
  }
}
