import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPage extends StatelessWidget {
  // URL to the Telegram bot
  final String _infoUrl = 'https://developers.africastalking.com/simulator';

  // Function to launch the URL
  void _launchURL() async {
    if (await canLaunch(_infoUrl)) {
      await launch(_infoUrl);
    } else {
      throw 'Could not launch $_infoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subscribe to our Events!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Stay updated with the latest events happening around you. '
              'Subscribe to get notifications and updates about upcoming events, special offers, and more!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Benefits of Subscribing:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '• Receive timely notifications about upcoming events.\n'
              '• Get exclusive access to special offers and discounts.\n'
              '• Be the first to know about new events and activities.\n'
              '• Personalized event recommendations based on your preferences.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('More Information'),
            ),
          ],
        ),
      ),
    );
  }
}
