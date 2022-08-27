// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/Large_game_page.dart';

import 'package:flutter_app/Providers/page_ctrlr.dart';

import 'package:flutter_app/helpers/responsive_widegt.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ndialog/ndialog.dart';

import 'package:provider/provider.dart';
import 'package:flutter_app/Constants/style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Page_Navigator.dart';
import 'Small_game_page.dart';

class gameScaffold extends StatelessWidget {
  final Widget smsa =
      SvgPicture.asset('assets/images/smsa.svg', semanticsLabel: 'smsa Logo');

  final Widget scome =
      SvgPicture.asset('assets/images/scome.svg', semanticsLabel: 'scome Logo');

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

// ···

  final Uri toLaunch =
      Uri(scheme: 'https', host: 'www.facebook.com', path: 'SMSAofficiall');
  @override
  Widget build(BuildContext context) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'om.elkousy@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            leading: Center(
              child: FittedBox(
                child: Consumer<PageProvider>(
                  builder: (context, value, child) => IconButton(
                    onPressed: () {
                      if (context.read<PageProvider>().currentPage ==
                          (PageTypes.game)) {
                        context.read<PageProvider>().reversePlaying();
                      }
                      context
                          .read<PageProvider>()
                          .changeCurrentPage(PageTypes.intro);
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    iconSize: 50,
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  height: 80,
                  width: 100,
                  child: FittedBox(
                    child: OutlinedButton(
                      onPressed: () async {
                        {
                          context.read<PageProvider>().reverseContact();
                          await NAlertDialog(
                            dismissable: false,
                            backgroundColor:
                                const Color.fromARGB(255, 136, 19, 10),
                            blur: 2,
                            dialogStyle: DialogStyle(titleDivider: true),
                            title: const Center(
                              child: Text(
                                "تواصل معنا",
                                style: TextStyle(
                                  fontFamily: 'ElMessiri',
                                ),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "هذا الموقع جزء من مشروع تعليم الإسعافات الأولية الذي تقيمه لجنة التعليم الطبي بالجمعية العلمية",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                  maxLines: 2,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: scome,
                                      ),
                                      Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          child: smsa),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                                Text(
                                  "تم التصميم والتطوير بواسطة: عمر القوصي ",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                                Text(
                                  "للتواصل مع المطور: om.elkousy@gmail.com",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                                Text(
                                  "للتعرف علي الجمعية, زر صفحتنا علي الفيسبوك ",
                                  style: TextStyle(
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 113, 38, 38),
                                ),
                                onPressed: () {
                                  _launchInBrowser(toLaunch);
                                  context.read<PageProvider>().reverseContact();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
                                },
                                child: const Text(
                                  'تواصل معنا',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 113, 38, 38),
                                ),
                                onPressed: () {
                                  launchUrl(emailLaunchUri);
                                  context.read<PageProvider>().reverseContact();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
                                },
                                child: const Text(
                                  'تواصل مع المطور',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 113, 38, 38),
                                ),
                                onPressed: () {
                                  context.read<PageProvider>().reverseContact();
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'عد للخلف',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                              ),
                            ],
                          ).show(context);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 6, color: Colors.red)),
                      child: const Text(
                        'تواصل معنا',
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            iconTheme: IconThemeData(color: dark),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  width: _width,
                  height: _height,
                  color: Colors.transparent,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Opacity(
                      opacity: .5,
                      child: Image.asset(
                        'assets/images/smoky.gif',
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Opacity(
                                  opacity: 0.12,
                                  child: Transform.translate(
                                    offset: Offset(0, -_width > 400 ? -70 : 0),
                                    child: Text(
                                      'لعبة',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: 'Blaka',
                                        fontSize: _width > 780
                                            ? 400
                                            : _width > 400
                                                ? 250
                                                : 150,
                                        letterSpacing: 10.0,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Opacity(
                                  opacity: 0.12,
                                  child: Transform.translate(
                                    offset: Offset(0, _width > 400 ? -100 : 0),
                                    child: Text(
                                      'الإسعافات',
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontFamily: 'Blaka',
                                        fontSize: _width > 780
                                            ? 400
                                            : _width > 400
                                                ? 250
                                                : 150,
                                        letterSpacing: 10.0,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Colors.white,
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
                  ],
                ),
              ),
              ResponsiveWidget(
                  largeScreen: LargeGamePage(),
                  mediumScreen: LargeGamePage(),
                  smallScreen: SmallGamePage()),
            ],
          ),
        );
      },
    );
  }
}
