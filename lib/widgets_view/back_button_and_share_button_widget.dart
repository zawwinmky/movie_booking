import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BackButtonAndShareButtonWidget extends StatelessWidget {
  const BackButtonAndShareButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kMarginLarge, vertical: kMarginMedium),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.chevron_left,
              size: kMarginXLarge,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.share,
            size: kMarginXLarge,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
