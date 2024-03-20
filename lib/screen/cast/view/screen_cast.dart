import 'package:flutter/material.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_widget/shammer_effect_2.dart';
import '../../home/model/home_model.dart';
import '../cubit/cast_cubit.dart';

class ScreenCast extends flutter.StatelessWidget {
  ScreenCast({super.key, required this.data});
  ShowModel data;

  @override
  flutter.Widget build(flutter.BuildContext context) {
    data.id;
    return BlocProvider(
      create: (context) => CastCubit(context, data.id),
      child: BlocBuilder<CastCubit, CastState>(
        builder: (context, state) {
          if (state is CastListState) {
            return flutter.Scaffold(
                appBar: flutter.AppBar(
                  backgroundColor: flutter.Colors.red,
                  leading: flutter.IconButton(
                      onPressed: () {
                        flutter.Navigator.of(context).pop();
                      },
                      icon: flutter.Icon(
                          flutter.Icons.arrow_back_ios_new_outlined)),
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: flutter.Text('Movie Cast'),
                ),
                backgroundColor: flutter.Colors.black,
                body: flutter.GridView.builder(
                  itemCount: state.casts.length,
                  gridDelegate:
                      flutter.SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0),
                  itemBuilder: (context, index) {
                    var cast = state.casts[index];
                    return flutter.Container(
                      child: flutter.Column(
                        children: [
                          flutter.CircleAvatar(
                            radius: 60,
                            backgroundImage: flutter.NetworkImage(
                                cast.person.image.original),
                          ),
                          flutter.Text(
                            cast.person.name,
                            style:
                                flutter.TextStyle(color: flutter.Colors.white),
                          ),
                          flutter.Text(
                            cast.character.name,
                            style: flutter.TextStyle(
                                color: flutter.Colors.white.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    );
                  },
                ));
            //  ListView.separated(
            //   itemCount: state.casts.length,
            //   itemBuilder: (context, index) {
            //     var cast = state.casts[index];
            //     return Container(
            //       decoration: BoxDecoration(color: Colors.red),
            //       child: Column(
            //         children: [

            //           Container(
            //             decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: NetworkImage(
            //                         cast.person.image.original))),
            //           ),
            //           Text(
            //             cast.person.name,
            //             style: TextStyle(color: Colors.white),
            //           )
            //         ],
            //       ),
            //     );
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return Divider(
            //       color: Colors.transparent,
            //     );
            //   },
            // ));
          } else {
            return flutter.Scaffold(
              body:
               flutter.Scaffold(
                appBar:  flutter.AppBar(
                  backgroundColor:  flutter.Colors.red,
                  centerTitle: true,
                  title: const  flutter.Text('Movie App'),
                ),
                body:  flutter.GridView.builder(
                  gridDelegate:  flutter.SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return  NewsCardSkelton2();
                  },
                ))
              
            );
          }
        },
      ),
    );
  }
}
