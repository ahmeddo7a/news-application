import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latestversion_news_app/cubit/appcubit.dart';
import 'package:latestversion_news_app/network/remote/dio_helper.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context,state){},
          builder: (context,state){

            var cubit = NewsCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                title: const Text('News App'),
                actions: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                  IconButton(onPressed: (){
                    AppCubit.get(context).changeDarkMode();
                  }, icon: const Icon(Icons.brightness_4_outlined)),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),

            );
          },
        )
    );
  }
}