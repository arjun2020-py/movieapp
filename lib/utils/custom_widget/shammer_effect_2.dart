//shmmer effect design
import 'package:flutter/material.dart';
import 'package:movieapp/utils/constents.dart';

import 'shmmer_skelton.dart';

class NewsCardSkelton2 extends StatelessWidget {
  const NewsCardSkelton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleSkeleton(),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleSkeleton(
                size: 100,
              ),
              SizedBox(height: defaultPadding / 2),
              Skeleton(),
              SizedBox(height: defaultPadding / 2),
              Skeleton(),
             // SizedBox(height: defaultPadding / 2),
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
