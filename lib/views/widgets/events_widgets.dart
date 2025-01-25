import 'package:flutter/material.dart';

class PopularEventsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Rectangle 32 (1).png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Popular events near you!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Unleash the fun! Explore the world of exciting events happening near you.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/userpicture.webp'), // Replace with your avatar path
                radius: 16.0,
              ),
              const SizedBox(width: 8.0),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/userpicture.webp'), // Replace with your avatar path
                radius: 16.0,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Add your button's functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'See more',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}