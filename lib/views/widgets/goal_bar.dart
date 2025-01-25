import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Confirm Action'),
        content: Text('Are you sure you want to join now?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              textStyle: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Join now"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 14),
            ),
          ),
        ],
      );
    },
  );
}

class GoalWidget extends StatelessWidget {
  final double progress;
  final int points;

  GoalWidget({required this.progress, required this.points});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Text and buttons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You’re close to your goal!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Join more sport activities to collect more points",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: screenWidth < 600 ? 1 : 2, // Adjust button width based on screen size
                        child: ElevatedButton(
                          onPressed: () {
                            showConfirmationDialog(context);
                          },
                          child: Text("Join now"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        flex: screenWidth < 600 ? 1 : 2, // Adjust button width based on screen size
                        child: ElevatedButton(
                          onPressed: () {
                            // You can add functionality here for "My points"
                          },
                          child: Text("My points"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Right side: Circular Progress Bar
            SizedBox(
              width: screenWidth < 600 ? 80 : 100, // Adjust width of progress bar for smaller screens
              child: CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 8.0,
                percent: progress,
                center: Text(
                  points.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                progressColor: Colors.blue,
                backgroundColor: Colors.blue[100]!,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
