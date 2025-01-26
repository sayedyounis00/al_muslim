// import 'package:al_muslim/core/widgets/custom_app_bar.dart';
// import 'package:al_muslim/core/widgets/isnside_noti.dart';
// import 'package:al_muslim/core/widgets/space.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

// class RateView extends StatefulWidget {
//   const RateView({
//     super.key,
//   });

//   @override
//   State<RateView> createState() => _RateViewState();
// }

// class _RateViewState extends State<RateView> {
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const CustomAppBar(
//               header: 'تقييم التطبيق', desc: 'ارسل ملاحظاتك واضافاتك'),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: TextField(
//               style: Theme.of(context)
//                   .textTheme
//                   .labelLarge!
//                   .copyWith(fontSize: 18),
//               textDirection: TextDirection.rtl,
//               controller: controller,
//               decoration: InputDecoration(
//                 hintTextDirection: TextDirection.rtl,
//                 hintText: 'اكتب رسالتك هنا',
//                 hintStyle: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .copyWith(fontSize: 18),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                       color: Theme.of(context).textTheme.labelLarge!.color!),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                       color: Theme.of(context).textTheme.labelLarge!.color!),
//                 ),
//               ),
//             ),
//           ),
//           const SpaceV(20),
//           InkWell(
//             onTap: () async {
//               final isCon = await InternetConnectionChecker().hasConnection;
//               if (controller.text.isNotEmpty && isCon) {
//                 await Sentry.captureMessage(controller.text);
//                 // عشان تقفل ال keyboard
//                 FocusScope.of(context).unfocus();
//                 controller.clear();
//                 InsideNotification.insideNotificationCard(
//                   time: 1,
//                   contentType: ContentType.success,
//                   context: context,
//                   title: 'تم ارسال التقييم',
//                   content: 'شكرا لإرسالك التقييم',
//                 );
//                 Future.delayed(
//                     const Duration(seconds: 2), () => Navigator.pop(context));
//               } else {}
//             },
//             child: Container(
//               width: double.infinity,
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(183, 33, 82, 243),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Text(
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//                 'إرسال',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           const SpaceV(70),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }

// class RateApp extends StatelessWidget {
//   const RateApp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return const RateView();
//             },
//           ));
//         },
//         child: SizedBox(
//           width: double.infinity,
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'تقييم التطبيق',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .copyWith(fontSize: 22, color: Colors.black),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
