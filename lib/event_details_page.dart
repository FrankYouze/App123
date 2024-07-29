import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'QrCodePage.dart'; // Import the QR code page

class EventDetailsPage extends StatefulWidget {
  final String phone;
  final String city;
  final String location;
  final String time;
  final String people;
  final String category;
  final double cost;

  EventDetailsPage({
    required this.phone,
    required this.city,
    required this.location,
    required this.time,
    required this.people,
    required this.category,
    required this.cost,
  });

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  String qrData = '';

  void _generateQrCode() {
    qrData = 'Event Details:\n'
        'Phone: ${widget.phone}\n'
        'City: ${widget.city}\n'
        'Location: ${widget.location}\n'
        'Time: ${widget.time}\n'
        'People Needed: ${widget.people}\n'
        'Category: ${widget.category}\n'
        'Estimated Cost: \$${widget.cost.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Event Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Phone: ${widget.phone}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'City: ${widget.city}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Location: ${widget.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Time: ${widget.time}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'People Needed: ${widget.people}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${widget.category}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Estimated Cost: \$${widget.cost.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _generateQrCode,
                child: Text('Generate QR Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
