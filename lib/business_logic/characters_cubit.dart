
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/character.dart';
import '../data/repo/character_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {


  CharactersCubit(this.characterRepo) : super(CharactersInitial());

  final CharacterRepo characterRepo;
  List<Character> characters = [];

  List<Character> getCharacter() {

    characterRepo.getCharacters().then((charactersInfo){
      emit(CharactersLoaded(charactersInfo));
      characters = charactersInfo;
    });
    return characters;
  }
}
