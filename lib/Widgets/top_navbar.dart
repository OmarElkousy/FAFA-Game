import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/Large_game_page.dart';
import 'package:flutter_app/site_Layout.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import '../Providers/page_ctrlr.dart';
import 'package:flutter_app/Constants/style.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

final String assetName = 'assets/images/smsa.svg';
final Widget smsa = SvgPicture.asset(assetName, semanticsLabel: 'smsa Logo');
final String assetName2 = 'assets/images/scome.svg';
final Widget scome = SvgPicture.asset(assetName2, semanticsLabel: 'scome Logo');

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
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'om.elkousy@gmail.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Example Subject & Symbols are allowed!',
  }),
);

final Uri toLaunch =
    Uri(scheme: 'https', host: 'www.facebook.com', path: 'SMSAofficiall');

AppBar topNavigationBar(BuildContext context) => AppBar(
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
                context.read<PageProvider>().changeCurrentPage(PageTypes.intro);
              },
              iconSize: 50,
              icon: const Icon(
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
                  await NAlertDialog(
                    dismissable: true,
                    backgroundColor: const Color.fromARGB(255, 136, 19, 10),
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
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: scome,
                              ),
                              Container(
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
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
                          primary: const Color.fromARGB(255, 113, 38, 38),
                        ),
                        onPressed: () {
                          _launchInBrowser(toLaunch);
                          Navigator.of(context).pushReplacementNamed('/');
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
                          primary: const Color.fromARGB(255, 113, 38, 38),
                        ),
                        onPressed: () {
                          launchUrl(emailLaunchUri);
                          Navigator.of(context).pushReplacementNamed('/');
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
                          primary: const Color.fromARGB(255, 113, 38, 38),
                        ),
                        onPressed: () {
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
    );
