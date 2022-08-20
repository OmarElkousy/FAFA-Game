import 'package:flutter/material.dart';

class FirstAidTask {
  final int id;
  final String name;
  final IconData icon;

  const FirstAidTask(this.icon, this.id, this.name);
}

class FAFAprovider with ChangeNotifier {
  List<FirstAidTask> _tasks = [
    FirstAidTask(Icons.airline_seat_flat, 1, 'المستوي الأول'),
    FirstAidTask(Icons.shower, 2, 'المستوي الثاني'),
    FirstAidTask(Icons.theaters_rounded, 3, 'المستوي الثالث'),
    FirstAidTask(Icons.sync_sharp, 4, 'المستوي الرابع'),
  ];

  List<FirstAidTask> get tasks => _tasks;

  FirstAidTask taskById(int neededId) {
    return _tasks.firstWhere((task) => task.id == neededId);
  }

  int _activeTask = 2;

  int get activeTask => _activeTask;

  void changeActive(int newActive) {
    _activeTask = newActive;
    notifyListeners();
  }
}
