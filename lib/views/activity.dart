import 'package:daily_tip/views/widgets/events_widgets.dart';
import 'package:daily_tip/views/widgets/goal_bar.dart';
import 'package:daily_tip/views/widgets/weekly_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../utils/appbar.dart';
import '../utils/navbar_mobile.dart';
import '../utils/providers.dart';

class ActivitiesView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activitiesProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final today = DateTime.now();
    final dayName = DateFormat.EEEE().format(today);
    final formattedDate = DateFormat('MMM d').format(today);
    final now = DateTime.now();
    final formattedDatee = DateFormat('EEEE, MMM d').format(now);
    Future.delayed(Duration.zero, () {
      ref.read(activitiesProvider.notifier).selectCategory(selectedCategory);
    });

    final filteredActivities = activities.where((activity) {
      final queryLower = searchQuery.toLowerCase();
      return activity.title.toLowerCase().contains(queryLower) ||
          activity.location.toLowerCase().contains(queryLower);
    }).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768; // Responsive breakpoint

        return Scaffold(
          appBar: isMobile ? buildCustomAppBar() : null, // App bar only for mobile
          body: Row(
            children: [
              if (!isMobile)

                NavigationRail(
                  extended: true,
                  selectedIndex: 0,
                  backgroundColor: Colors.black,
                  onDestinationSelected: (index) {
                    // Handle navigation
                  },
                  leading: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/icons/TWNSQR.svg',
                      color: Colors.white,
                      height: 24,
                    ),
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          color: Colors.grey,
                          height: 24,
                        ),
                      ),
                      selectedIcon: SvgPicture.asset(
                        'assets/icons/calendar.svg',
                        color: Colors.blue,
                        height: 24,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0), // Add space between icon and label
                        child: Text(
                          "Activities",
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/map.svg',
                          color: Colors.white,
                          height: 24,
                        ),
                      ),
                      selectedIcon: SvgPicture.asset(
                        'assets/icons/map.svg',
                        color: Colors.white,
                        height: 24,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Location",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: Colors.white,
                          height: 24,
                        ),
                      ),
                      selectedIcon: SvgPicture.asset(
                        'assets/icons/star.svg',
                        color: Colors.white,
                        height: 24,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Services",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/users.svg',
                          color: Colors.white,
                          height: 24,
                        ),
                      ),
                      selectedIcon: SvgPicture.asset(
                        'assets/icons/users.svg',
                        color: Colors.white,
                        height: 24,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Communities",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/bell.svg',
                          color: Colors.white,
                          height: 24,
                        ),
                      ),
                      selectedIcon: SvgPicture.asset(
                        'assets/icons/bell.svg',
                        color: Colors.white,
                        height: 24,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Notifications",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                  trailing: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle button press
                          },
                          icon: Icon(Icons.add, color: Colors.black),
                          label: Text("Create", style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/images/userpicture.webp'),
                                backgroundColor: Colors.grey.shade300,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Username",
                                style: TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert, color: Colors.white),
                                onPressed: () {
                                  // Handle three-dots menu action
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              Expanded(
                child: Column(
                  children: [
                    if(!isMobile)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            formattedDatee,
                            style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all( isMobile ? 8.0 : 20.0),
                      child: Row(
                        children: [
                          Text(
                            "This week in Estepona",
                            style: TextStyle(
                              fontSize: isMobile ? 18.0 : 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isMobile) // Display GoalWidget in mobile view
                      GoalWidget(
                        progress: 0.6,
                        points: 34,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        onChanged: (value) {
                          ref.read(searchQueryProvider.notifier).state = value;
                        },
                        decoration: InputDecoration(
                          hintText: "What do you feel like doing?",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
height: 40,
child: ListView(
scrollDirection: Axis.horizontal,
children: ["All", "Sports", "Food", "Kids", "Creative"]
    .map((category) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: ChoiceChip(
label: Text(
category,
style: TextStyle(
color: selectedCategory == category
? Colors.black
    : Colors.black,
),
),
selected: selectedCategory == category,
selectedColor: Color(0xFFEEE1F5),
backgroundColor: Color(0xBAA1C8),
onSelected: (isSelected) {
if (isSelected) {
ref.read(selectedCategoryProvider.notifier).state = category;
ref.read(activitiesProvider.notifier).selectCategory(category);
}
},
padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Custom padding
),
);
}).toList(),
),
),
Padding(
padding: const EdgeInsets.only(left: 16.0, top: 16.0),
child: Row(
children: [
Text(
"Today / $dayName",
style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
),
],
),
),
Expanded(
child: filteredActivities.isEmpty
? Center(child: Text("No activities found"))
    : ListView.builder(
itemCount: filteredActivities.length,
itemBuilder: (context, index) {
final activity = filteredActivities[index];
return Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
width: 8.0,
height: 120.0,
decoration: BoxDecoration(
border: Border(
left: BorderSide(
color: Colors.grey.withOpacity(0.5),
width: 1.0,
),
),
),
child: Column(
children: [
if (index == 0)
Container(
width: 8,
height: 8,
margin: EdgeInsets.only(left: 4.0),
decoration: BoxDecoration(
color: Colors.yellow,
shape: BoxShape.circle,
),
),
],
),
),
Expanded(
child: Card(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12.0),
),
margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
color: Colors.white,
elevation: 3,
child: Padding(
padding: const EdgeInsets.all(12.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Text(
activity.time,
style: TextStyle(
fontSize: 12.0,
fontWeight: FontWeight.w500,
),
),
SizedBox(width: 8),
Text(
activity.duration,
style: TextStyle(
fontSize: 12.0,
fontWeight: FontWeight.w500,
color: Colors.grey,
),
),
],
),
SizedBox(height: 8),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
activity.title,
style: TextStyle(
fontSize: 14.0,
fontWeight: FontWeight.w700,
),
),
Text(
"${activity.price}€",
style: TextStyle(
fontSize: 14.0,
fontWeight: FontWeight.w700,
),
),
],
),
SizedBox(height: 8),
Row(
children: [
Icon(
Icons.location_on,
size: 14.0,
color: Colors.grey,
),
SizedBox(width: 4),
Text(
activity.location,
style: TextStyle(
fontSize: 12.0,
color: Colors.grey,
fontWeight: FontWeight.w500,
),
),
],
),
SizedBox(height: 8),
Row(
children: [
Container(
padding: EdgeInsets.symmetric(
horizontal: 8.0, vertical: 4.0),
decoration: BoxDecoration(
color: Colors.grey.withOpacity(0.2),
borderRadius: BorderRadius.circular(4.0),
),
child: Text(
"${activity.availability} spots left",
style: TextStyle(
fontSize: 12.0,
color: Colors.grey,
),
),
),
SizedBox(width: 8),
Container(
padding: EdgeInsets.symmetric(
horizontal: 8.0, vertical: 4.0),
decoration: BoxDecoration(
color: Colors.lightBlueAccent.withOpacity(0.2),
borderRadius: BorderRadius.circular(4.0),
),
child: Text(
activity.difficulty,
style: TextStyle(
fontSize: 12.0,
color: Colors.lightBlueAccent,
),
),
),
Spacer(),
ElevatedButton(
onPressed: () {
  showConfirmationDialog(context);
},
style: ElevatedButton.styleFrom(
padding: EdgeInsets.symmetric(
horizontal: 24.0, vertical: 8.0),
backgroundColor: Colors.black,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(8.0),
),
),
child: Text(
"Join",
style: TextStyle(
fontSize: 14.0,
color: Colors.white,
),
),
),
],
),
],
),
),
),
),
],
);
},
),
),
                  ],
                ),
              ),
              if (!isMobile)
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate the width dynamically based on the screen size
                    double containerWidth = constraints.maxWidth > 1200
                        ? 400
                        : constraints.maxWidth * 0.3; // Adjust as needed

                    return Container(
                      width: containerWidth,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1200 ? 16.0 : 8.0,
                      ), // Adjust padding for smaller screens
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "News & Updates",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxWidth > 1200 ? 18 : 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          GoalWidget(
                            progress: 0.4,
                            points: 34,
                          ),
                          SizedBox(height: 20),
                          WeeklyWorkshopsWidget(),
                          SizedBox(height: 20),
                          PopularEventsWidget(),
                          // Add more widgets for news, updates, etc.
                        ],
                      ),
                    );
                  },
                ),

            ],
          ),
          bottomNavigationBar:
          isMobile ? CustomNavBar() : null,
          backgroundColor: Colors.white,
        );
      },
    );
  }
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

}



