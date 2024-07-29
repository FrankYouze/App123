import 'package:app/eventModel.dart';
import 'package:flutter/material.dart';

class Eventcart extends ChangeNotifier{

  List<Eventmodel> _events = [];

 List <Eventmodel> get eCart => _events;


 void addEvent(Eventmodel event) {
   _events.add(event);
   notifyListeners();
 }
  void removeEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }

}