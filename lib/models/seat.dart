import 'package:flutter/material.dart';

class Seat {
  Seat({
    required this.seatNumber,
    required this.seatClass,
    this.seatColor,
    this.seatStatus,
  });

  final double seatNumber;
  final String seatClass;
  Color? seatColor = Colors.green;
  String? seatStatus = 'Available';

  void changeStatus(Color color, String status) {
    seatColor = color;
    seatStatus = status;
  }
}
