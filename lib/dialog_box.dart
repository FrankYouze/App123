import 'package:app/eventModel.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';




class QRBox extends StatelessWidget {
  final String event;
  const QRBox({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: AlertDialog(
        content: QrImageView(data:event,),
      ),
    );
  }
}