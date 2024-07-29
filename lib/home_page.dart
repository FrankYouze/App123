import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';
import 'about_page.dart';
import 'contact_us_page.dart';
import 'application_page.dart';
import 'profile_page.dart';
import 'subscription_page.dart';
import 'event_details_page.dart';
import 'qr_code_page.dart';

class HomePage extends StatelessWidget {
  final String email;

  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Welcome, $email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Event Details'),
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Subscription'),
              onTap: () {
                Navigator.pushNamed(context, '/subscription');
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code),
              title: Text('QR Code'),
              onTap: () {
                Navigator.pushNamed(context, '/qr-code');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, $email', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Image.asset('assets/events.jpeg',
                height: 150), // Add an image related to QR codes
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qr-code');
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
