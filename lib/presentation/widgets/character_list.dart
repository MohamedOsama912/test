import 'package:flutter/material.dart';

import '../../data/model/character.dart';
import 'inner_image.dart';

class BuildCharacterList extends StatelessWidget {
  BuildCharacterList({
    super.key,
    required this.allCharacters,
  });

  final List<Character> allCharacters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: allCharacters[index],
        );
      },
    );
  }
}
