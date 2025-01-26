import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/sabha/presentation/views/all_azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vibration/vibration.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key, this.zkr = 'سبحان الله '});
  final String zkr;

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () async {
            if (await Vibration.hasVibrator() == true &&
                (count == 33 || count == 66 || count == 99)) {
              Vibration.vibrate();
            }
            if (count == 99) {
              count = 0;
            }
            count++;
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                downloadButt: () {
                  count = 0;
                  setState(() {});
                },
                downloadIcon: Icons.repeat,
                hasDownload: true,
                header: 'السبحة',
                desc: '',
              ),
              Text(
                textAlign: TextAlign.center,
                widget.zkr,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color!)
                    .copyWith(height: 2,fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).textTheme.headlineSmall!.color!),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const AllAzkarView()),
                  );
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/icons/prayer-beads.png'),
                ),
              ),
              const SpaceV(20),
            ],
          ),
        ),
      ),
    );
  }
}
