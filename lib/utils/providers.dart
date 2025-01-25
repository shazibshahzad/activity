import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/activity.dart';
import '../view_model/activity_vm.dart';

final activitiesProvider =
StateNotifierProvider<ActivitiesViewModel, List<Activity>>(
        (ref) => ActivitiesViewModel());

final selectedCategoryProvider = StateProvider<String>((ref) => "All");
final searchQueryProvider = StateProvider<String>((ref) => '');

