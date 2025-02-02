import 'dart:async';
import 'dart:math';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:flutter/material.dart';

class RandomCard extends StatefulWidget {
  const RandomCard({
    super.key,
  });

  @override
  State<RandomCard> createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  late int hadith;
  Timer? _timer;

  static const List<String> hadithList = [
    // أحاديث في الطهارة
    "قال رسول الله ﷺ: «الطهور شطر الإيمان».",
    "قال رسول الله ﷺ: «إذا استيقظ أحدكم من نومه، فليغسل يديه قبل أن يدخلهما في الإناء ثلاثًا، فإنه لا يدري أين باتت يده».",

    // أحاديث في الصلاة
    "قال رسول الله ﷺ: «صلوا كما رأيتموني أصلي».",
    "قال رسول الله ﷺ: «إذا قام أحدكم إلى الصلاة فلا يبصق قبل وجهه، فإنما يناجي الله ما دام في مصلاه».",
    "قال رسول الله ﷺ: «من أدرك ركعة من الصلاة فقد أدرك الصلاة».",

    // أحاديث في الزكاة
    "قال رسول الله ﷺ: «من آتاه الله مالًا فلم يؤد زكاته، مُثِّل له يوم القيامة شجاعًا أقرع يطوقه، ثم يأخذ بلهزمتيه - يعني شدقيه - ثم يقول: أنا مالك، أنا كنزك».",
    "قال رسول الله ﷺ: «ما من صاحب ذهب ولا فضة لا يؤدي منها حقها إلا إذا كان يوم القيامة صفحت له صفائح من نار، فأحمي عليها في نار جهنم، فيكوى بها جنبه وجبينه وظهره».",

    "قال رسول الله ﷺ: «إذا ولغ الكلب في إناء أحدكم فليغسله سبع مرات، أولاهن بالتراب».",
    // أحاديث في الصيام
    "قال رسول الله ﷺ: «من صام رمضان إيمانًا واحتسابًا غفر له ما تقدم من ذنبه».",
    "قال رسول الله ﷺ: «إذا جاء رمضان فتحت أبواب الجنة، وغلقت أبواب النار، وصفدت الشياطين».",
    "قال رسول الله ﷺ: «الصيام جنة، فإذا كان يوم صوم أحدكم فلا يرفث ولا يجهل، فإن امرؤ قاتله أو شاتمه فليقل: إني صائم».",

    // أحاديث في المعاملات
    "قال رسول الله ﷺ: «البيعان بالخيار ما لم يتفرقا، فإن صدقا وبينا بورك لهما في بيعهما، وإن كتما وكذبا محقت بركة بيعهما».",
    "قال رسول الله ﷺ: «من غشنا فليس منا».",
    "قال رسول الله ﷺ: «لا يحل مال امرئ مسلم إلا بطيب نفس منه».",

    // أحاديث في الجهاد
    "قال رسول الله ﷺ: «من مات ولم يغزُ، ولم يحدث نفسه بالغزو، مات على شعبة من نفاق».",
    "قال رسول الله ﷺ: «رباط يوم في سبيل الله خير من الدنيا وما فيها».",

    // أحاديث في الأخلاق والآداب
    "قال رسول الله ﷺ: «لا يحل لمسلم أن يهجر أخاه فوق ثلاث ليال».",
    "قال رسول الله ﷺ: «من كان يؤمن بالله واليوم الآخر فليقل خيرًا أو ليصمت».",
    "قال رسول الله ﷺ: «لا تغضب».",
  ];

  @override
  void initState() {
    super.initState();
    hadith = Random().nextInt(hadithList.length);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        hadith = Random().nextInt(hadithList.length);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CirculeActionButton(
                    color: const Color.fromARGB(255, 70, 129, 154),
                    icon: Icons.replay,
                    radius: 20,
                    onTap: () {
                      hadith = Random().nextInt(hadithList.length);
                      setState(() {});
                    },
                  ),
                ),
                Text(
                  'الحديث اليومي',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CirculeActionButton(
                    onTap: () async {
                      InsideNotification.takeScreenshotAndShare(
                        zkr: hadithList[hadith],
                      );
                    },
                    color: Colors.orange,
                    icon: Icons.share,
                    radius: 20,
                  ),
                ),
              ],
            ),
            const SpaceV(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                hadithList[hadith],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(height: 1.5),
              ),
            ),
            const SpaceV(10),
          ],
        ),
      ),
    );
  }
}
