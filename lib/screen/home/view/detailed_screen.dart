import 'package:flutter/material.dart' as flutter;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../cast/view/screen_cast.dart';
import '../compoents/show_elev_button.dart';
import '../model/home_model.dart';

class ScreenDetailed extends flutter.StatelessWidget {
  ScreenDetailed({super.key, required this.shows});
  ShowModel shows;
  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.Scaffold(
      backgroundColor: flutter.Colors.black,
      appBar: flutter.AppBar(
        leading: flutter.Container(
          decoration: const flutter.BoxDecoration(
              shape: flutter.BoxShape.circle, color: flutter.Color(0xffd9e3f5)),
          child: flutter.IconButton(
            onPressed: () => flutter.Navigator.of(context).pop(),
            icon: const flutter.Icon(
              flutter.Icons.arrow_back_ios_new_rounded,
              color: flutter.Colors.red,
            ),
          ),
        ),
        actions: [
          flutter.Container(
            decoration: const flutter.BoxDecoration(
                shape: flutter.BoxShape.circle,
                color: flutter.Color(0xffd9e3f5)),
            child: flutter.IconButton(
              onPressed: () => flutter.Navigator.of(context).pop(),
              icon: const flutter.Icon(
                flutter.Icons.bookmark,
                color: flutter.Colors.red,
              ),
            ),
          ),
          const flutter.SizedBox(
            width: 10,
          ),
          flutter.Container(
            decoration: const flutter.BoxDecoration(
                shape: flutter.BoxShape.circle,
                color: flutter.Color(0xffd9e3f5)),
            child: flutter.IconButton(
              onPressed: () => flutter.Navigator.of(context).pop(),
              icon: const flutter.Icon(
                flutter.Icons.share,
                color: flutter.Colors.red,
              ),
            ),
          ),
          const flutter.SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: flutter.Colors.transparent,
      ),
      body: flutter.SingleChildScrollView(
        child: flutter.Center(
          child: flutter.Column(
            children: [
              flutter.Image.network(
                shows.image.original,
                width: 160,
              ),
              // flutter.Container(
              //   decoration: flutter.BoxDecoration(
              //       image: flutter.DecorationImage(
              //           image: flutter.NetworkImage(
              //               shows.image.original))),
              // ),
              flutter.Text(
                shows.name,
                style: const flutter.TextStyle(
                    color: flutter.Colors.white, fontSize: 30),
              ),
              flutter.Text(
                shows.language.name,
                style: const flutter.TextStyle(
                    color: flutter.Colors.white, fontSize: 15),
              ),
              flutter.Row(
                mainAxisAlignment: flutter.MainAxisAlignment.center,
                crossAxisAlignment: flutter.CrossAxisAlignment.center,
                children: [
                  flutter.Text(
                    shows.premiered.year.toString(),
                    style: const flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                  const flutter.SizedBox(
                    width: 10,
                  ),
                  const flutter.Text(
                    '*',
                    style: flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                  flutter.Text(
                    ' ${shows.genres[0].name},',
                    style: const flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                  // Text(
                  //   ' ${shows.genres[1].name},',
                  //   style: const TextStyle(
                  //       color: Colors.white, fontSize: 15),
                  // ),
                ],
              ),
              flutter.Row(
                mainAxisAlignment: flutter.MainAxisAlignment.center,
                crossAxisAlignment: flutter.CrossAxisAlignment.center,
                children: [
                  const flutter.Text(
                    'rating:',
                    style: flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                  const flutter.SizedBox(
                    width: 10,
                  ),
                  flutter.Text(
                    shows.rating.average.toString(),
                    style: const flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                  const flutter.Text(
                    '/',
                    style: flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                  const flutter.Text(
                    '10',
                    style: flutter.TextStyle(
                        color: flutter.Colors.white, fontSize: 15),
                  ),
                ],
              ),
              const flutter.SizedBox(
                height: 10,
              ),
              flutter.Row(
                mainAxisAlignment: flutter.MainAxisAlignment.spaceAround,
                children: [
                  ShowElvButton(
                    text: 'Play ',
                    bgColor: flutter.Colors.red,
                    width: 0.4,
                    icons: flutter.Icons.play_arrow,
                  ),
                  ShowElvButton(
                    text: 'Download',
                    bgColor: flutter.Colors.white,
                    width: 0.4,
                    icons: flutter.Icons.download,
                  )
                ],
              ),
              const flutter.SizedBox(
                height: 10,
              ),
              HtmlWidget(
                shows.summary,
                textStyle: const flutter.TextStyle(color: flutter.Colors.white),
              ),
              const flutter.Padding(
                padding: flutter.EdgeInsets.only(right: 180),
                child: flutter.Text(
                  'Movie Cast:',
                  style: flutter.TextStyle(
                      color: flutter.Colors.white, fontSize: 18),
                ),
              ),
              flutter.ElevatedButton(
                onPressed: () {
                  flutter.Navigator.of(context).push(flutter.MaterialPageRoute(
                      builder: (context) => ScreenCast(
                            data: shows,
                          )));
                },
                child: flutter.Text('show cast'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
