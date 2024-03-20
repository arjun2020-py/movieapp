//shmmer effect design
import 'package:flutter/material.dart';
import 'package:movieapp/utils/constents.dart';

import 'shmmer_skelton.dart';



class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleSkeleton(),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 100),
              SizedBox(height: defaultPadding / 2),
              Skeleton(),
              SizedBox(height: defaultPadding / 2),
              Skeleton(),
              SizedBox(height: defaultPadding / 2),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Skeleton(),
              //     ),
              //     SizedBox(width: defaultPadding),
              //     Expanded(
              //       child: Skeleton(),
              //     ),
              //   ],
              // )
            ],
          ),
        )
      ],
    );
  }
}

