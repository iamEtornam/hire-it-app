import 'package:flutter/material.dart';
import 'package:hire_it/custom_colors.dart';

class CustomLogo extends StatelessWidget {
  final double size;
  const CustomLogo({ Key? key,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: CustomColors.customBlueColor,
      child: Center(child: Text('H',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)),
    );
  }
}