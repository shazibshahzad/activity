import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

AppBar buildCustomAppBar() {
  final now = DateTime.now();
  final formattedDate = DateFormat('EEEE, MMM d').format(now);

  return AppBar(
    automaticallyImplyLeading: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formattedDate,
          style: TextStyle(fontSize: 13, color: Colors.grey[400]),
        ),
      ],
    ),
    actions: [
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/userpicture.webp"
            ),
          ),
          SizedBox(width: 16),
        ]
      ),
    ],
    backgroundColor: Colors.white
  );
}