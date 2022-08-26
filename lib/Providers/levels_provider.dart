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
        "ماتش بلايستيشن",
        "assets/images/level_1.png",
        "إبراهيم ومحمود كانوا نازلين يلعبوا شوية, ولكن حصلت حاجة مكانوش متوقعينها. هتقدر تنقذهم؟ ",
        [
          BreakPoint(
              0,
              Duration(seconds: 55, milliseconds: 11),
              'هتعمل ايه دلوقتي ',
              Answer('نبص لو في خطر ف المكان وبعدين نروح', true),
              Answer(' نجري علطول ع الشخص الي مغمى عليه', false),
              () {}),
          BreakPoint(
              1,
              Duration(minutes: 1, seconds: 25, milliseconds: 13),
              'هتعمل ايه دلوقتي ',
              Answer('هتحاول تاخد منه رد فعل', true),
              Answer(' تديله مايه', false),
              () {}),
          BreakPoint(
              2,
              Duration(minutes: 1, seconds: 26, milliseconds: 45),
              'يا ترى هتعمل ايه علشان تاخد منه رده فعل؟ ',
              Answer(' تقعد تهز ف وشه وتنادم عليه بصوت هادي', false),
              Answer('تخبط ع كتفه وتنادم عليه بصوت عالي', true),
              () {}),
          BreakPoint(
              3,
              Duration(minutes: 1, seconds: 33, milliseconds: 27),
              'هل الشخص يستجيب؟ ',
              Answer('لا', true),
              Answer('نعم ', false),
              () {}),
          BreakPoint(
              4,
              Duration(minutes: 1, seconds: 35, milliseconds: 53),
              'يا ترى هنعمل ايه دلوقتي ',
              Answer('نشوف نبض القلب موجود ولا لا', true),
              Answer('نبدأ ف انعاش القلب والرئه او السي بي ار ', false),
              () {}),
          BreakPoint(
              5,
              Duration(minutes: 1, seconds: 57, milliseconds: 28),
              'يا ترى هنعمل ايه دلوقتي بعد مشوفنا النبض؟ ',
              Answer('نبدأ دلوقتي ف انعاش القلب والرئه او السي بي ار ', false),
              Answer('نفتح مجرى الهواء علشان يقدر يتنفس', true),
              () {}),
          BreakPoint(
              6,
              Duration(minutes: 2, seconds: 23, milliseconds: 50),
              'يا ترى هنعمل ايه دلوقتي بعد مفتحنا مجرى التنفس؟ ',
              Answer('نشوف ونسمع ونحس هل الشخص دا بيتنفس ولا لا ؟', true),
              Answer('نسمع الشخص بيتنفس ولا لا', false),
              () {}),
          BreakPoint(
              7,
              Duration(minutes: 2, seconds: 24, milliseconds: 51),
              'يا ترى لمده كام؟ ',
              Answer('10 ثواني', true),
              Answer('5 ثواني ', false),
              () {}),
          BreakPoint(
              8,
              Duration(minutes: 2, seconds: 33, milliseconds: 58),
              'هل بيتنفس طبيعي ولا لا؟ ',
              Answer('ايوه ', false),
              Answer('لا', true),
              () {}),
          BreakPoint(
              9,
              Duration(minutes: 2, seconds: 46, milliseconds: 14),
              'يا ترى هنعمل ايه دلوقتي؟ ',
              Answer('نجرب نفوقه ونديله مايه ', false),
              Answer('نتصل بالاسعاف 123', true),
              () {}),
          BreakPoint(
              10,
              Duration(minutes: 2, seconds: 52, milliseconds: 33),
              'يا ترى هنعمل ايه دلوقتي؟ ',
              Answer('نبدأ انعاش القلب والرئه', true),
              Answer('نشوفه بيتنفس تاني ولا لا ', false),
              () {}),
          BreakPoint(
              11,
              Duration(minutes: 3, seconds: 00, milliseconds: 57),
              'يا ترى هنضغط فين؟ ',
              Answer('رقم 1', true),
              Answer('رقم 2 ', false),
              () {}),
          BreakPoint(
              12,
              Duration(minutes: 3, seconds: 06, milliseconds: 28),
              'يا ترى هنضغط وشكل ايدك ازاي؟ ',
              Answer('رقم 1 ', false),
              Answer('رقم 2', true),
              () {}),
          BreakPoint(
              13,
              Duration(minutes: 3, seconds: 27, milliseconds: 30),
              'يا ترى هنضغط وشكل دراعك ازاي؟ ',
              Answer('رقم 2', true),
              Answer('رقم 1 ', false),
              () {}),
          BreakPoint(
              14,
              Duration(minutes: 3, seconds: 33, milliseconds: 38),
              'يا ترى هنضغط ووضعيه جسمك ازاي؟ ',
              Answer('رقم 1', true),
              Answer('رقم 2 ', false),
              () {}),
          BreakPoint(
              15,
              Duration(minutes: 3, seconds: 38, milliseconds: 50),
              'يا ترى ازاي هتضغط على الصدر ؟ ',
              Answer(
                  'ضغطتين كل ثانيه لعمق 5 سم ونسيب الصدر يرجع مكانه بعد كل ضغطه',
                  true),
              Answer(
                  'ضغطتين كل ثانيه لعمق 9 سم ومش لازم الصدر يرجع مكانه بعد الضغطه ',
                  false),
              () {}),
          BreakPoint(
              16,
              Duration(minutes: 3, seconds: 41, milliseconds: 16),
              'مش خايف وانت بتضغط تكسر ضلع يتكسر ؟ ',
              Answer('نضغط براحه جدا علشان الضلوع متتكسرش ', false),
              Answer('نضغط بقوه وميهمكش الضلوع', true),
              () {}),
          BreakPoint(
              17,
              Duration(minutes: 3, seconds: 47, milliseconds: 58),
              'تفتكر هنضغط كام ضغطه ف الدقيقة ؟ ',
              Answer('100 ضغطه', true),
              Answer('60 ضغطة ', false),
              () {}),
          BreakPoint(
              18,
              Duration(minutes: 3, seconds: 51, milliseconds: 37),
              'تفتكر ايه الهدف من الضغط ع الصدر ؟ ',
              Answer('نحفز القلب انه يشتغل من تاني ', false),
              Answer('نوصل الدم للمخ والاعضاء المهمه', true),
              () {}),
          BreakPoint(
              19,
              Duration(minutes: 4, seconds: 07, milliseconds: 29),
              ' تفتكر اثناء ال100 ضغطه فالدقيقه نعمل انعاش فموي ولا لاء ؟ ',
              Answer('نعمله وندي نفسين بعد كل 30 ضغطه ', true),
              Answer('ملهوش لازمه ', false),
              () {}),
          BreakPoint(
              20,
              Duration(minutes: 4, seconds: 35, milliseconds: 08),
              ' دلوقتي  المفروض نعمل ايه ؟ ',
              Answer(' منحاولش تاني خلاص طالما الشخص مداش اي رده فعل ', false),
              Answer(
                  ' نفضل نعمل 30 ضغطة ونفسين انقاذ لغايه م الاسعاف توصل', true),
              () {}),
        ],
        'KWmUevNKBZc'),
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
