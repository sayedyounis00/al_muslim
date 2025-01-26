
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/athkar/data/models/zkr_item.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareAndFavRow extends StatefulWidget {
  final ZkrItem azkar;
  const ShareAndFavRow({super.key, required this.azkar});

  @override
  State<ShareAndFavRow> createState() => _ShareAndFavRowState();
}

class _ShareAndFavRowState extends State<ShareAndFavRow> {
  late int count;
  bool isFav = false;
  bool isFinshed = false;

  isFavMethod() async {
    isFav = await BlocProvider.of<FavCubit>(context).isFound(widget.azkar);
  }

  @override
  void initState() {
    count = widget.azkar.count;
    isFavMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isFavMethod();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //fav button

        IconButton(
          padding: const EdgeInsets.all(20),
          color: Colors.teal,
          onPressed: () {
            if (!isFav) {
              BlocProvider.of<FavCubit>(context).addToFav(widget.azkar);
            } else {
              BlocProvider.of<FavCubit>(context).removeFromFav(widget.azkar);
            }
            isFav = !isFav;
            setState(() {});
          },
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline,
              color: Colors.teal),
        ),

        //count button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.teal),
              shape: WidgetStateProperty.all(const CircleBorder()),
              fixedSize: WidgetStateProperty.all(const Size(70, 70)),
            ),
            onPressed: () {
              count--;
              if (count == 0) {
                isFinshed = true;
              }
              setState(() {});
            },
            child: Text(
              isFinshed ? 'تم' : '$count',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),

        //shareButton
        IconButton(
            onPressed: () {
              InsideNotification.takeScreenshotAndShare(
                context: context,
                zkr: widget.azkar.text,
              );
            },
            icon: const Icon(
              Icons.share,
              color: Colors.teal,
            )),
      ],
    );
  }
}
