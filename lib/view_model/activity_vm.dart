import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/activity.dart';

class ActivitiesViewModel extends StateNotifier<List<Activity>> {
  ActivitiesViewModel() : super([]) {
    fetchActivities();
  }

  String _selectedCategory = "All";
  String _searchQuery = "";

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  void fetchActivities() {
    // Mock data
    state = [
      Activity(
        time: "08:00",
        duration: " (60 min)",
        title: "Beach Yoga",
        location: "La Playa de la Rada",
        price: 9,
        availability: "8 ",
        category: "Kids ",
        difficulty: "light",
      ),
      Activity(
        time: "09:00",
        duration: " (60 min)",
        title: "Reformer Pilates",
        location: "Wellness Studio",
        price: 15,
        category: "Creative",
        availability: "3 ",
        difficulty: "medium",
      ),
      Activity(
        time: "12:30 ",
        duration: " (60 min)",
        category: "Sports",
        title: "5-a-side Football",
        location: "Municipal Sports Center",
        price: 19,
        availability: "Sold out",
        difficulty: "high",
        isSoldOut: true,
      ),
    ];
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    filterActivities();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    filterActivities();
  }

  void filterActivities() {
    List<Activity> filteredActivities = [
      Activity(
        time: "08:00",
        duration: " (60 min)",
        title: "Beach Yoga",
        location: "La Playa de la Rada",
        price: 9,
        availability: "8 ",
        category: "Kids ",
        difficulty: "light",
      ),
      Activity(
        time: "09:00",
        duration: " (60 min)",
        title: "Reformer Pilates",
        location: "Wellness Studio",
        price: 15,
        category: "Creative",
        availability: "3 ",
        difficulty: "medium",
      ),
      Activity(
        time: "12:30 ",
        duration: " (60 min)",
        category: "Sports",
        title: "5-a-side Football",
        location: "Municipal Sports Center",
        price: 19,
        availability: "Sold out",
        difficulty: "high",
        isSoldOut: true,
      ),
    ];

    // Filter by selected category
    if (_selectedCategory != "All") {
      filteredActivities = filteredActivities
          .where((activity) =>
      activity.category.trim().toLowerCase() == _selectedCategory.trim().toLowerCase())
          .toList();
    }

    // Further filter by search query
    if (_searchQuery.isNotEmpty) {
      filteredActivities = filteredActivities
          .where((activity) =>
      activity.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          activity.category.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          activity.location.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    state = filteredActivities;
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must interact with the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Action'),
          content: Text('Are you sure you want to proceed?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Add your action here
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
