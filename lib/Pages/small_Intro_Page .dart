// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';

class SmallIntroPage extends StatelessWidget {
  const SmallIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          children: [
            Spacer(),
            Container(
              color: Colors.transparent,
              height: _height * .6,
              width: _width,
              child: LayoutBuilder(builder: ((context, constraints) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        width: constraints.maxWidth * .7,
                        height: constraints.maxHeight * .1,
                        child: FittedBox(
                          child: Text(
                            'تقدم لجنة التعليم الطبي',
                            style: TextStyle(
                              fontSize: 250,
                              color: Colors.white,
                              fontFamily: 'ElMessiri',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        width: constraints.maxWidth * .6,
                        height: constraints.maxHeight * .32,
                        child: FittedBox(
                          child: Text(
                            'لعبة',
                            style: TextStyle(
                              fontSize: 400,
                              color: Colors.white,
                              fontFamily: 'Blaka',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        width: constraints.maxWidth * .9,
                        height: constraints.maxHeight * .32,
                        child: FittedBox(
                          child: Text(
                            'الإسعافات',
                            style: TextStyle(
                              fontSize: 400,
                              color: Colors.white,
                              fontFamily: 'Blaka',
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        width: constraints.maxWidth * .4,
                        height: constraints.maxHeight * .1,
                        child: FittedBox(
                          child: Text(
                            'هل ستستطيع الإنقاذ؟',
                            style: TextStyle(
                              fontSize: 300,
                              color: Colors.red,
                              fontFamily: 'ElMessiri',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
            ),
            Container(
              color: Colors.transparent,
              height: _height * .3,
              width: _width,
              child: LayoutBuilder(builder: ((context, constraints) {
                return Stack(
                  children: [
                    Positioned(
                      top: _width < 300 ? 5 : 20,
                      right: 20,
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        height: _width < 400
                            ? constraints.maxHeight * .25
                            : constraints.maxHeight * .3,
                        width: _width < 400
                            ? constraints.maxWidth * .3
                            : constraints.maxWidth * .5,
                        child: FittedBox(
                          child: OutlinedButton(
                            onPressed: () {
                              context
                                  .read<PageProvider>()
                                  .changeCurrentPage(PageTypes.levels);
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                side: const BorderSide(
                                    width: 6, color: Colors.red)),
                            child: const Text(
                              'العب الان',
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: 'ElMessiri',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })),
            ),
          ],
        ),
        Positioned(
          left: 0.0,
          bottom: 0.0,
          child: Transform.translate(
            offset: Offset(0, 10),
            child: Container(
              width: _width < 780 && _width > 570
                  ? 0.5 * _width
                  : _width < 570 && _width > 400
                      ? 0.5 * _width
                      : 0.5 * _width,
              height: _width < 780 && _width > 700
                  ? 0.6 * _height
                  : _width < 570 && _width > 550
                      ? 0.5 * _height
                      : 0.5 * _height,
              color: Colors.transparent,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/person.png')),
            ),
          ),
        ),
        Positioned(
          right: 5.0,
          bottom: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'كل الحقوق محفوظة للجمعية ',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'ElMessiri',
                    color: Colors.white60),
              ),
              Text(
                ' العلمية لطلبة الطب بسوهاج',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'ElMessiri',
                    color: Colors.white60),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
