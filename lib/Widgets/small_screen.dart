import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/fafa.dart';
import 'package:provider/provider.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int activeTaskId = context.watch<FAFAprovider>().activeTask;
    FirstAidTask taskByID = context.read<FAFAprovider>().taskById(activeTaskId);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(taskByID.name),
          Text(taskByID.name),
          Text(taskByID.name)
        ],
      ),
    );
  }
}
