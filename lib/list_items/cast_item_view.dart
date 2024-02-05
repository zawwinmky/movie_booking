import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/data/VOs/credit_vo.dart';
import 'package:movie_booking/utils/dimensions.dart';

class CastItemView extends StatelessWidget {
  final CreditVO? creditVO;
  const CastItemView({super.key, required this.creditVO});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kMarginMedium2),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: creditVO?.getCastImageUrl() ?? "",
          width: kMargin60,
          height: kMargin60,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) {
            return Image.network(
                "https://www.shutterstock.com/image-vector/caution-exclamation-mark-white-red-260nw-1055269061.jpg");
          },
        ),
        // child: Image.network(
        //   creditVO?.getCastImageUrl() ??
        //       "",
        //   width: kMargin60,
        //   height: kMargin60,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
