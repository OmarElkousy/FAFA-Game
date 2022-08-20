import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/game/Large_game_page.dart';
import 'package:flutter_app/site_Layout.dart';
import 'package:provider/provider.dart';
import '../Providers/page_ctrlr.dart';
import 'package:flutter_app/Constants/style.dart';
import 'package:flutter_app/helpers/responsive_widegt.dart';
import 'package:flutter_app/Constants/style.dart' as fess;

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
                onPressed: () {},
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
