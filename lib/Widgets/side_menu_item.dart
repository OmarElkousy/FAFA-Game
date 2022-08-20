import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/style.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/Providers/fafa.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  final int id;
  const SideMenuItem(
      {Key? key, required this.itemName, required this.onTap, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    FirstAidTask taskByID = context.read<FAFAprovider>().taskById(id);
    int activeTaskId = context.watch<FAFAprovider>().activeTask;

    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: taskByID.id == activeTaskId,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 6,
                height: 40,
                color: dark,
              ),
            ),
            SizedBox(width: _width / 88),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(taskByID.icon),
            ),
            if (taskByID.id == activeTaskId)
              Flexible(
                child: Text(
                  itemName,
                  style: TextStyle(
                      color: dark, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            if (taskByID.id != activeTaskId)
              Flexible(
                child: Text(
                  itemName,
                  style: TextStyle(
                    color: lightGrey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
