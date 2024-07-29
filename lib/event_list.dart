import 'package:app/dialog_box.dart';
import 'package:app/eventCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final EventList = context.watch<Eventcart>().eCart;

    return Scaffold(
      appBar: AppBar(
        title: Text('MY EVENTS LIST'),
      ),
      body: ListView.builder(
        itemCount: EventList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(EventList[index].eventName),
              onTap: () {
                // Navigate to the event details screen
                //Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails()));
              },
              trailing: IconButton(
                icon: Icon(Icons.qr_code),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return QRBox(
                          event: EventList[index]
                              .toString(),
                        );
                      });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
