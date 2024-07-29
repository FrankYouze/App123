import 'package:app/dialog_box.dart';
import 'package:app/eventCart.dart';
import 'package:app/eventModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_details_page.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  String _selectedCategory = 'Standard';
  final Map<String, double> _categoryCosts = {
    'Standard': 50.0,
    'VIP': 100.0,
    'VVIP': 200.0,
  };

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      final phone = _phoneController.text;
      final city = _cityController.text;
      final location = _locationController.text;
      final time = _timeController.text;
      final people = _peopleController.text;
      final category = _selectedCategory;

      final cost = _categoryCosts[category];

      // Navigate to EventDetailsPage and pass the event details
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsPage(
            phone: phone,
            city: city,
            location: location,
            time: time,
            people: people,
            category: category,
            cost: cost!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Enter event details:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Event Name',
                  ),
                 // keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter event name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone  Number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the event contacts';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Event Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time of Event',
                    hintText: 'e.g., 2024-07-25 18:00',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the time of the event';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _peopleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of People Needed',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of people needed';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                  items: ['Standard', 'VIP', 'VVIP']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Event Category',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an event category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Estimated Cost: \$${_categoryCosts[_selectedCategory]}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Text(
                  'About Us',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to our event management application! We provide a simple way to manage and track event details. Enter the event details in the fields above to keep track of your events. We aim to make event management easier and more efficient for everyone.',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: ()async{
                       showDialog(context: context, builder: (context){

      return QRBox(event: Eventmodel(eventName:  _phoneController.text, eventAttend:_peopleController.text, eventLocation: _locationController.text, eventTime: _timeController.text, eventPHONE: _cityController.text).toString(),);
    });
   context.read<Eventcart>().addEvent(Eventmodel(eventName: _phoneController.text, eventAttend: _peopleController.text , eventLocation:_locationController.text, eventTime: _timeController.text, eventPHONE: _cityController.text));
        print(context.read<Eventcart>().eCart);
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
