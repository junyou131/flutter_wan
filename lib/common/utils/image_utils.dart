import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedImage(String url,
    {double? width, double? height, BoxFit? fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    fit: fit,
    placeholder: (BuildContext context, String url) {
      return Container(
        color: Colors.grey[200],
      );
    },
    errorWidget: (BuildContext context, String url, dynamic error) {
      return const Icon(Icons.error);
    },
  );
}
