import 'package:flutter/material.dart';

class DietModel {
  String nama;
  String iconPatch;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewSelected;

  DietModel({
    required this.nama,
    required this.iconPatch,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewSelected
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
      nama: 'Honey Pancake',
       iconPatch: 'assets/icons/pancake-svgrepo-com.svg',
        level: 'Easy',
         duration: '30mins',
          calorie: '180Cal',
          boxColor: const Color.fromARGB(255, 201, 110, 103),
           viewSelected: true
           )
    );

    diets.add(
      DietModel(
      nama: 'Canai Bread',
       iconPatch: 'assets/icons/bread-svgrepo-com.svg',
        level: 'Easy',
         duration: '20mins',
          calorie: '230Cal',
          boxColor: const Color.fromARGB(255, 152, 201, 103),
           viewSelected: false
           )
    );
    return diets;
  }
}