import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latestversion_news_app/cubit/appcubit.dart';
import 'package:latestversion_news_app/cubit/appstates.dart';
import 'package:latestversion_news_app/network/local/cache_helper.dart';
import 'layouts/newsapp_layout.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  bool? darkMode = CacheHelper.getData(key: 'darkMode');
  if (darkMode != null) {
    runApp(MyApp(darkMode));
  }else{
    runApp(const MyApp(false));
  }
}

class MyApp extends StatelessWidget {
  final bool darkMode;
  const MyApp(this.darkMode, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) =>AppCubit()..changeDarkMode(fromShared: darkMode),
      child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,

                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color : Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(color: Colors.black),

                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20.0,
                    selectedItemColor: Colors.indigo,
                  ),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),

                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('221e33'),
                  appBarTheme:  AppBarTheme(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('221e33'),
                      statusBarIconBrightness: Brightness.light,

                    ),
                    backgroundColor:HexColor('221e33'),
                    elevation: 0.0,
                    titleTextStyle:const TextStyle(
                      color : Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme:const IconThemeData(color: Colors.white),

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20.0,
                    selectedItemColor: HexColor('233b7a'),
                    unselectedItemColor: Colors.white,
                    backgroundColor: HexColor('110f19'),

                  ),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
                themeMode:AppCubit.get(context).darkMode ? ThemeMode.dark : ThemeMode.light,
                home: const NewsLayout()
            );
          },
      ),
    );
  }
}
