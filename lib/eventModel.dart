class Eventmodel{

 final String eventName;
final String eventAttend;
final String eventLocation;
final String eventTime;
final String eventPHONE;

Eventmodel({required this.eventName, required this.eventAttend, required this.eventLocation, required this.eventTime, required this.eventPHONE});


  @override
  String toString() {

    return '{name: $eventName,location: $eventLocation, time: $eventTime,attendee:$eventAttend , phone: $eventPHONE }';
  }

}