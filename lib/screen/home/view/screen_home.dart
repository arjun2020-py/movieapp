import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_color/custom_color.dart';
import '../../../utils/custom_widget/custom_text.dart';
import '../../../utils/custom_widget/shammer_effect_1.dart';
import '../cubit/home_cubit.dart';
import 'detailed_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ShowListState) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.red,
                centerTitle: true,
                title: const Text('Movie App'),
              ),
              body: GridView.builder(
                itemCount: state.shows.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var show = state.shows[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenDetailed(
                        shows: show,
                      ),
                    )),
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            show.image.original.toString(),
                            width: 100,
                          ),
                          CustomText(
                            text: show.name,
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: show.rating.average.toString(),
                                color: whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )
                              // Text(show.rating.average.toString())
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return 
            Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.red,
                  centerTitle: true,
                  title: const Text('Movie App'),
                ),
                body: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return NewsCardSkelton();
                  },
                ));
          }
        },
      ),
    );
  }
}
