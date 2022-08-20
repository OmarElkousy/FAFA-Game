import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/levels_provider.dart';

class MediumGamePage extends StatelessWidget {
  const MediumGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentLevelId = context.read<LevelsProvider>().currentLevelId;
    FirstAidLevel currentLevel =
        context.read<LevelsProvider>().getLevelById(currentLevelId);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Row(
            children: [
              Container(
                width: _width,
                color: Colors.red,
                padding: EdgeInsets.fromLTRB(10, 20, 50, 20),
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [],
                      ),
                      width: constraints.maxWidth * .95,
                      height: constraints.maxHeight * .7,
                      color: Colors.purple,
                    ),
                    Container(
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: Text(
              'كل الحقوق محفوظة للجمعية العلمية لطلبة الطب بسوهاج',
              style: TextStyle(
                  fontSize: 15, fontFamily: 'ElMessiri', color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
