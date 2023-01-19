import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/core/constatns/styles.dart';
import 'package:work/core/network/local/cache_helper.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/modules/onBoarding/onBoarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
 bool isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark,));
}

class MyApp extends StatelessWidget {
 final bool isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppCubit()..changeAppMode(fromShared: isDark))],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const OnBoardingScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

//90463025823-lhhnemmcikl7c6c0u2c6m2e0g7s8nnbv.apps.googleusercontent.com
