import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const AlMuslim());
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..initialDataFromLDB(),
      child: const MainWidget(),
    );
  }
}
