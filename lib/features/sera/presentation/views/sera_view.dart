import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/sera/data/model/sera_lesson_model.dart';
import 'package:al_muslim/features/sera/presentation/views/widgets/sera_lesson_card.dart';
import 'package:flutter/material.dart';

class SeraView extends StatelessWidget {
  const SeraView({super.key});

  @override
  Widget build(BuildContext context) {
    List<SeraLessonModel> seraList = [
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=LI99lWP1zac&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=1',
        lessonTitle: 'الدرس الأول - العالم قبل الإسلام',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=A6_y0HuwSQw&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=2',
        lessonTitle: 'الدرس الثاني - مولد النبي وبداية شبابه',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=nqpVIANGU-o&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=3',
        lessonTitle:
            'الدرس الثالث - وصف النبي صلي الله عليه وسلم وزواجه من السيدة خديجة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=6SiKw-qQ6mk&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=4',
        lessonTitle: 'الدرس الرابع- نزول الوحي علي النبي والدعوة السرية بمكة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=GLvr-pYGLOs&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=5',
        lessonTitle: 'الدرس الخامس -  بداية الجهر بالدعوة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=aliwSuClQRI&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=6',
        lessonTitle:
            'الدرس السادس -بداية فترة استضعاف المسلمين في مكة والهجرة إلي الحبشة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=dZ1EkPuj91w&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=7',
        lessonTitle:
            'الدرس السابع- إسلام عمر بن الخطاب ووفاة أبو طالب عم النبي',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=Tl1NmCYk1G4&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=8',
        lessonTitle:
            'الدرس الثامن- عام الحزن ورحلة النبي صلي الله عليه وسلم إلي الطائف',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=mvwhozvTKd8&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=9',
        lessonTitle: 'الدرس التاسع- رحلة الإسراء والمعراج',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=SlBo6bmtuTI&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=10',
        lessonTitle: 'الدرس العاشر- الطواف علي القبائل وبيعة العقبة الأولي',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=GGFse7G6cAs&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=11',
        lessonTitle: 'الدرس الحادي عشر- أحداث الهجرة إلي المدينة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=3rzbyI2_cvc&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=12',
        lessonTitle:
            'الدرس الثاني عشر- بداية العهد المدني وتأسيس مدينة للمسلمين',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=7spRnIahHk4&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=13',
        lessonTitle:
            'الدرس الثالث عشر- مجتمع المدينة ومفهوم الجهاد في سبيل الله',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=b7YVYhcQdfU&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=14',
        lessonTitle: 'الدرس الرابع عشر - غزوة بدر',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=Pt2EEsFtf5Y&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=15',
        lessonTitle: 'الدرس الخامس عشر - أحداث ما بين بدر وأحد',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=EWvAT3HcUic&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=16',
        lessonTitle: 'الدرس السادس عشر - غزوة أحد',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=2XJ1102-9rg&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=17',
        lessonTitle: 'الدرس السابع عشر- حادثة الإفك',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=XPql-o9tQ0s&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=18',
        lessonTitle: 'الدرس الثامن عشر- غزوة الخندق',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=mbsTyEaQmJY&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=19',
        lessonTitle: 'الدرس التاسع عشر- صلح الحديبية',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=3MF0xKJ2DWo&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=20',
        lessonTitle: 'الدرس العشرون- غزوة خيبر',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=9SX9K1csx28&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=21',
        lessonTitle: 'الدرس الواحد والعشرون- أحداث ما قبل فتح مكة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=TSkXmxSs-pA&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=22',
        lessonTitle: 'الدرس الثاني والعشرون - فتح مكة',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=ySswp1_bn4A&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=23',
        lessonTitle: 'الدرس الثالث والعشرون - غزوة حنين وحصار الطائف',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=ZrcxE10HVoQ&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=24',
        lessonTitle: 'الدرس الرابع والعشرون - غزوة تبوك',
      ),
      SeraLessonModel(
        lessonLink:
            'https://www.youtube.com/watch?v=k8CLspkQSEk&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=25',
        lessonTitle: 'الدرس الخامس والعشرون - وفاة النبي ﷺ',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            header: 'السيرة النبوية',
            desc: 'مجموعة فيديوهات د/احمد عامر لشرح ودراسة السيرة النبوية',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: seraList.length,
              itemBuilder: (context, index) {
                return SeralessonCard(
                  lesson: seraList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
