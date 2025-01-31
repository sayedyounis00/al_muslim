import 'package:al_muslim/features/alquran/data/quran_images_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preload_page_view/preload_page_view.dart';

class QuranImagesScreen extends StatefulWidget {
  final int pageNumber;
  const QuranImagesScreen({super.key, required this.pageNumber});

  @override
  State<QuranImagesScreen> createState() => _QuranImagesScreenState();
}

class _QuranImagesScreenState extends State<QuranImagesScreen> {
  late PreloadPageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PreloadPageController(initialPage: widget.pageNumber - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: PreloadPageView.builder(
        controller: pageController,
        reverse: true,
        itemCount: 604,
        itemBuilder: (context, index) {
          String imgUrl = QuranImagesServices().getSurahImageUrl(index + 1);
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3.0,
                  ),
                ),
                child: CachedNetworkImage(
                    color: Theme.of(context).textTheme.headlineLarge!.color,
                    imageUrl: imgUrl,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(color: Colors.orange)),
                    errorWidget: (context, url, error) =>
                        const Text("فشل التحميل")),
              ),
              SizedBox(height: 15.h),
              Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
