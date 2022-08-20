import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/responsive_widegt.dart';
import 'package:flutter_app/Widgets/side_menu_item.dart';
import 'package:flutter_app/Providers/fafa.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Constants/style.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    List<FirstAidTask> tasks = context.read<FAFAprovider>().tasks;

    return Container(
      color: light,
      child: Column(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 50),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        constraints:
                            BoxConstraints(maxHeight: 70, maxWidth: 100),
                        child: Image.asset("assets/icons/logo.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'مستويات اللعبة',
                        style: TextStyle(
                            color: dark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: (tasks.map(
              (task) => SideMenuItem(
                  itemName: task.name,
                  id: task.id,
                  onTap: () {
                    context.read<FAFAprovider>().changeActive(task.id);
                  }),
            )).toList(),
          )
        ],
      ),
    );
  }
}
