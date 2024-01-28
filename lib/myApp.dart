import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/chat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/profail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/setting.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/views/login_screen.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/views/register_screen.dart';
import 'package:flutter_application_1/Feather/splach/presentaion/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyBloc()
            ..getUserData()
            ..getAsk()
            ..getSomeWork()
            ..getAllAsk()
            ..getCaroies()
            ..getconsultantbloc()
            ..getCaroiestouser(),

        ),
        BlocProvider(create: (context) => RatingCubit()),
        BlocProvider(
          create: (context) => AdminBloc()
            ..getUserData()
            ..getconsultant()
            ..getAllUser()
            ..getCaroies(),
        ),
      ],
      child: BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Consult_me ',
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
            theme: ThemeData.light(), //MyThemData.lightThem,
            darkTheme: ThemeData.dark(), //MyThemData.darkTheam,
            themeMode: MyBloc.get(context).themeMode,
            initialRoute: SplashView.nameKey,
            routes: {
              SplashView.nameKey: (_) => const SplashView(),
              LoginScreen.nameKey: (_) => const LoginScreen(),
              HomeLayOut.nameKey: (_) => const HomeLayOut(),
              RegisterScreen.nameKey: (_) => const RegisterScreen(),
              Profail.nameKey: (_) => Profail(),
              Setting.nameKey: (_) => const Setting(),
              ChatScreen.nameKey: (_) => const ChatScreen(),
            },
          );
        },
      ),
    );
  }
}
