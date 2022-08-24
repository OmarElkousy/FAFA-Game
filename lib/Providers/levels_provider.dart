import 'package:flutter/material.dart';

class FirstAidLevel {
  final int id;
  final String name;

  final String thumbnailAsset;
  final String description;
  final List<BreakPoint> breakPoints;
  final String videoLink;

  const FirstAidLevel(
    this.id,
    this.name,
    this.thumbnailAsset,
    this.description,
    this.breakPoints,
    this.videoLink,
  );
}

class Answer {
  final String text;
  final bool isCorrect;
  const Answer(this.text, this.isCorrect);
}

class BreakPoint {
  final int id;
  final Duration timestamp;
  final String title;
  final Answer answer1;
  final Answer answer2;
  final Function onWrong;
  bool isChecked = false;
  BreakPoint(
    this.id,
    this.timestamp,
    this.title,
    this.answer1,
    this.answer2,
    this.onWrong,
  );
}

class LevelsProvider with ChangeNotifier {
  final List<FirstAidLevel> _levels = [
    FirstAidLevel(
        1,
        "الاختناق",
        "assets/images/level_1.jpg",
        "وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف ",
        [
          BreakPoint(
              0,
              Duration(seconds: 5, milliseconds: 80),
              'هتعمل ايه دلوقتي ',
              Answer('نبص لو في خطر ف المكان بعدين نروح ', true),
              Answer(' نجري علطول ع الشخص الي مغمى عليه  ', false),
              () {}),
          BreakPoint(
              1,
              Duration(minutes: 1, seconds: 11, milliseconds: 80),
              'هتعمل ايه دلوقتي',
              Answer('هتحاول تاخد منه رد فعل ', true),
              Answer(' تديله مايه ', false),
              () {}),
          BreakPoint(
              2,
              Duration(minutes: 1, seconds: 14, milliseconds: 80),
              'هتعمل ايه علشان تاخد منه رد فعل ',
              Answer('تخبط ع كتفه وتنادم عليه بصوت عالي', true),
              Answer(' تهز وشه وتنده عليه بصوت هادي', false),
              () {}),
          BreakPoint(
              3,
              Duration(minutes: 1, seconds: 21, milliseconds: 80),
              'هل الشخص بيستجيب  ',
              Answer('لا', true),
              Answer(' اه', false),
              () {}),
          BreakPoint(
              4,
              Duration(minutes: 1, seconds: 23, milliseconds: 80),
              'هنعمل ايه دلوقتي  ',
              Answer('نشوف نبض القلب شغال ولا لاء ', true),
              Answer(' نبدأ انعاش القلب والرئة او السي بي ار ', false),
              () {}),
          BreakPoint(
              5,
              Duration(minutes: 1, seconds: 42, milliseconds: 80),
              'هنعمل ايه دلوقتي بعد مشوفنا النبض ',
              Answer('نفتح مجرى الهواء علشان يقدر يتنفس ', true),
              Answer(' نبدا السي بي ار او انعاش القلب والرئه ', false),
              () {}),
          BreakPoint(
              6,
              Duration(minutes: 1, seconds: 54, milliseconds: 80),
              'تفتكر ازاي هنفتح مجري التنفس؟ ',
              Answer('نحاول نحط ايدينا ف بوقه ونشد لسانه لبرا ', false),
              Answer(' نرجع راسه للخلف ونرفع الفك السفلي شويه لفوق ', true),
              () {}),
          BreakPoint(
              7,
              Duration(minutes: 2, seconds: 13, milliseconds: 80),
              'هنعمل ايه دلوقتي',
              Answer('نبص ونشوف ونسمع ان الشخص بيتنفس', true),
              Answer(' نبص عليه نشوفه بيتنفس ولا لا', false),
              () {}),
          BreakPoint(
              8,
              Duration(minutes: 2, seconds: 15, milliseconds: 80),
              'لمده كام  ',
              Answer('لمده 5 ثواني', false),
              Answer(' لمده 10 ثواني ', true),
              () {}),
          BreakPoint(
              9,
              Duration(minutes: 2, seconds: 22, milliseconds: 80),
              'هل الشخص بيتنفس طبيعي   ',
              Answer('نعم', false),
              Answer(' لأ ', true),
              () {}),
          BreakPoint(
              10,
              Duration(minutes: 2, seconds: 34, milliseconds: 80),
              'هنعمل ايه دلوقتي   ',
              Answer('نتصل بالاسعاف 123 ', true),
              Answer(' نشربه مايه ', false),
              () {}),
          BreakPoint(
              11,
              Duration(minutes: 2, seconds: 40, milliseconds: 80),
              'تفتكر ليه هنعمل انعاش القلب والرئه او الcpr',
              Answer('معندوش نبض ومش بيتنفس ', true),
              Answer(' عنده نبض بس مش بيتنفس ', false),
              () {}),
          BreakPoint(
              12,
              Duration(minutes: 2, seconds: 42, milliseconds: 80),
              'هنعمل ايه دلوقتي   ',
              Answer('نبدا انعاش القلب والرئه ', true),
              Answer(' نشوفه بيتنفس تاني ولا لاء ', false),
              () {}),
          BreakPoint(
              13,
              Duration(minutes: 2, seconds: 51, milliseconds: 80),
              'ياتري نضغط فين    ',
              Answer('1', true),
              Answer('2', false),
              () {}),
          BreakPoint(
              14,
              Duration(minutes: 2, seconds: 57, milliseconds: 80),
              'هتضغط وشكل ايدك ازاي بقا    ',
              Answer('1', false),
              Answer('2', true),
              () {}),
          BreakPoint(
              15,
              Duration(minutes: 3, seconds: 9, milliseconds: 80),
              'ازاي هتضغط ع الصدر     ',
              Answer('ضغطه كل ثانيه بعمق 9 سم', false),
              Answer('ضغطتين كل ثانيه لعمق 5 سم ', true),
              () {}),
          BreakPoint(
              16,
              Duration(minutes: 3, seconds: 18, milliseconds: 80),
              'تفتكر مين فيهم وضع ايدك بيكون صح     ',
              Answer('1', false),
              Answer('2', true),
              () {}),
          BreakPoint(
              17,
              Duration(minutes: 3, seconds: 24, milliseconds: 80),
              'ياتري انهي وضع للجسم صح',
              Answer('1', true),
              Answer('2', false),
              () {}),
          BreakPoint(
              18,
              Duration(minutes: 3, seconds: 29, milliseconds: 80),
              'مش خايف وانت بتضغط الضلوع تتكسر؟',
              Answer('نضغط براحه علشان الضلوع متتكسرش ', false),
              Answer('نضغط بقوه وميهمكش الضلوع ', true),
              () {}),
          BreakPoint(
              19,
              Duration(minutes: 3, seconds: 39, milliseconds: 80),
              'المفروض نضغط كام ضغطه ف الدقيقه  ',
              Answer('60 ضغطه ', false),
              Answer('100 ضغطه ', true),
              () {}),
          BreakPoint(
              20,
              Duration(minutes: 3, seconds: 41, milliseconds: 80),
              'اثناء ال100 ضغطه فالدقيقه نعمل انعاش فموي ولا لاء ',
              Answer('نعمله وندي نفسين انقاذ بعد كل 30 ضغطه', true),
              Answer('ملهوش لازمه دلوقتي ', false),
              () {}),
          BreakPoint(
              21,
              Duration(minutes: 4, seconds: 9, milliseconds: 80),
              'المفروض دلوقتي نعمل ايه  ',
              Answer(
                  'نفضل نعمل 30 ضغطة ونفسين انقاذ لغايه م الاسعاف توصل ', true),
              Answer('منحاولش تاني خلاص طالما الشخص مداش اي رده فعل', false),
              () {}),
        ],
        'IR8FU2-qdmE'),
    FirstAidLevel(
        2,
        "بلع اللسان",
        "assets/images/level_2.jpg",
        "وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف",
        [
          BreakPoint(
              0,
              Duration(seconds: 5, milliseconds: 80),
              'هتعمل ايه دلوقتي ',
              Answer('نبص لو في خطر ف المكان بعدين نروح ', true),
              Answer(' نجري علطول ع الشخص الي مغمى عليه  ', false),
              () {}),
          BreakPoint(
              1,
              Duration(minutes: 0, seconds: 11, milliseconds: 80),
              'هتعمل ايه دلوقتي',
              Answer('هتحاول تاخد منه رد فعل ', true),
              Answer(' تديله مايه ', false),
              () {}),
          BreakPoint(
              2,
              Duration(minutes: 0, seconds: 14, milliseconds: 80),
              'هتعمل ايه علشان تاخد منه رد فعل ',
              Answer('تخبط ع كتفه وتنادم عليه بصوت عالي', true),
              Answer(' تهز وشه وتنده عليه بصوت هادي', false),
              () {}),
          BreakPoint(
              3,
              Duration(minutes: 0, seconds: 21, milliseconds: 80),
              'هل الشخص بيستجيب  ',
              Answer('لا', true),
              Answer(' اه', false),
              () {}),
          BreakPoint(
              4,
              Duration(minutes: 0, seconds: 23, milliseconds: 80),
              'هنعمل ايه دلوقتي  ',
              Answer('نشوف نبض القلب شغال ولا لاء ', true),
              Answer(' نبدأ انعاش القلب والرئة او السي بي ار ', false),
              () {}),
          BreakPoint(
              5,
              Duration(minutes: 0, seconds: 42, milliseconds: 80),
              'هنعمل ايه دلوقتي بعد مشوفنا النبض ',
              Answer('نفتح مجرى الهواء علشان يقدر يتنفس ', true),
              Answer(' نبدا السي بي ار او انعاش القلب والرئه ', false),
              () {}),
        ],
        '87-qdflIMdE'),
    FirstAidLevel(
        3,
        "النزيف",
        "assets/images/level_1.jpg",
        "وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف",
        [
          BreakPoint(
              1,
              Duration(seconds: 1, milliseconds: 80),
              'الكلام علي ايه',
              Answer('ديرز', true),
              Answer(' "ديرزاوي"', false),
              () {}),
          BreakPoint(
              2,
              Duration(seconds: 1, milliseconds: 80),
              'الكلام علي طبط',
              Answer('ديرز', true),
              Answer(' "ديرزاوي"', false),
              () {}),
          BreakPoint(
              3,
              Duration(seconds: 1, milliseconds: 80),
              'الكلام علي موعرها',
              Answer('ديرز', true),
              Answer(' "ديرزاوي"', false),
              () {}),
        ],
        'OreVJYNhK24')
  ];

  List<FirstAidLevel> get levels => _levels;

  int _currentLevelId = 1;

  int get currentLevelId => _currentLevelId;

  void changeCurrentLevelId(int newCurrentId) {
    _currentLevelId = newCurrentId;
    notifyListeners();
    print(currentLevelId);
  }

  FirstAidLevel getCurrentlevel() {
    return _levels.firstWhere((level) => level.id == _currentLevelId);
  }

  FirstAidLevel getLevelById(int levelId) {
    FirstAidLevel wantedlevel =
        _levels.firstWhere((level) => level.id == levelId);

    return wantedlevel;
  }
}
