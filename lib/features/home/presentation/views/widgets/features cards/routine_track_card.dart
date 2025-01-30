import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class RoutineTrackCard extends StatelessWidget {
  const RoutineTrackCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'هذه الخاصية غير متوفرة حاليا\n ترقبوا التحديث',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.width / 5,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'ختمات القرآن',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 20),
                    child: LinearProgressBar(
                      borderRadius: BorderRadius.circular(20),
                      progressType: LinearProgressBar.progressTypeLinear,
                      progressColor: Colors.orange,
                      backgroundColor: Colors.white,
                      minHeight: 1,
                      maxSteps: 9,
                      currentStep: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
