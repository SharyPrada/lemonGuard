import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lemon_guard_frontend/models/monitoring.dart';

class TreeDataService {
  Future<List<TreeData>> loadTreeData() async {
    final String response = await rootBundle.loadString('assets/data/trees_data.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => TreeData.fromJson(json)).toList();
  }
}
