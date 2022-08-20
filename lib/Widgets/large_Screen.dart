import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/fafa.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int activeTaskId = context.watch<FAFAprovider>().activeTask;
    FirstAidTask taskByID = context.read<FAFAprovider>().taskById(activeTaskId);

    return Row(
      children: [
        Expanded(
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: Container(
              color: Colors.blue,
              child: Text(taskByID.name),
            ),
          ),
        ),
      ],
    );
  }
}
