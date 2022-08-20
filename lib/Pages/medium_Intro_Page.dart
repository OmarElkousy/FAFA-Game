// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Providers/page_ctrlr.dart';

class MediumIntroPage extends StatelessWidget {
  const MediumIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: .65 * _width,
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: _width < 1000 ? Offset(0, 50) : Offset(0, 0),
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.centerRight,
                        height: constraints.maxHeight * .08,
                        width: constraints.maxWidth * .4,
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
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.transparent,
                      alignment: Alignment.centerRight,
                      height: constraints.maxHeight * .3,
                      width: constraints.maxWidth * .6,
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
                      // ignore: prefer_const_constructors
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      color: Colors.transparent,
                      height: constraints.maxHeight * .3,
                      width: constraints.maxWidth * .9,
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
                      // ignore: prefer_const_constructors
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.transparent,
                      alignment: Alignment.centerRight,
                      height: constraints.maxHeight * .08,
                      width: constraints.maxWidth * .5,
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
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.transparent,
                      alignment: Alignment.centerRight,
                      height: constraints.maxHeight * .065,
                      width: constraints.maxWidth * .3,
                      child: FittedBox(
                        child: Text(
                          'قرارك حياة',
                          style: TextStyle(
                            fontSize: 250,
                            color: Colors.white,
                            fontFamily: 'ElMessiri',
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .4,
                        ),
                        Transform.translate(
                          offset: Offset(0, -30),
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            height: constraints.maxHeight * .12,
                            width: constraints.maxWidth * .3,
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
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: _width < 1000 ? Offset(-80, 10) : Offset(10, 10),
                child: Container(
                  width: 0.3 * _width,
                  height: _height * .9,
                  color: Colors.transparent,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/person.png')),
                ),
              ),
            ),
            Container(
              width: 0.05 * _width,
              color: Colors.transparent,
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
    );
  }
}
