import 'package:flutter/material.dart';

Widget commonScaffold({required String title,required Widget child}) {
  return Scaffold(
    key: GlobalKey(),
    appBar: AppBar(
      centerTitle: true,
      title: Text(title),
    ),
    body: child,
  );
}

Widget space({double? height,double? width}){
  return SizedBox(height: height,);
}

