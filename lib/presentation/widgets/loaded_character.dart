import 'package:flutter/material.dart';

import '../../data/model/character.dart';

import 'character_list.dart';

class BuildLoadedWidget extends StatelessWidget {
   BuildLoadedWidget({
    super.key,
    required this.allCharacters,
  });
  final List<Character> allCharacters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [BuildCharacterList(allCharacters: allCharacters)],
        ),
      ),
    );
  }
}