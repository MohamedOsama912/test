import 'package:flutter/material.dart';
import 'package:omar_ahmed/data/model/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key, required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 12),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.blue,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
          style: const TextStyle(
            height: 1.3,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Colors.black,
          child: character.image.isNotEmpty ?
                FadeInImage.assetNetwork(
                    width: double.infinity,
                    placeholder: 'assets/images/loading.gif',
                    image: character.image,
                fit: BoxFit.cover,
              ) : Image.asset('assets/images/fail.jpg'),
        ),
      ),
    );
  }
}