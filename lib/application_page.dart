import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final _formKey = GlobalKey<FormState>();
  String _eventName = '';
  String _eventDetails = '';
  String _qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Event Name'),
                onSaved: (value) {
                  _eventName = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter event name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Event Details'),
                onSaved: (value) {
                  _eventDetails = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter event details';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      _qrData = 'Event: $_eventName\nDetails: $_eventDetails';
                    });
                    Navigator.pushNamed(context, '/qr-code',
                        arguments: _qrData);
                  }
                },
                child: Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
