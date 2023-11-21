import 'package:flutter/material.dart';

class AppBArWidget extends StatelessWidget {
  final String title;
  final Widget ?iconData;
  const AppBArWidget({required this.title,this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title:Text(title),actions: [iconData ?? const SizedBox()],);
  }
}