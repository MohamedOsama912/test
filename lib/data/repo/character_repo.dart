import '../model/character.dart';
import '../web_service/character_web_service.dart';

class CharacterRepo {
  final CharcacterService charcacterService;

  CharacterRepo(this.charcacterService);

  Future<List<Character>> getCharacters() async {
    final characterInfo = await charcacterService.getCharacters(); // Call the function
    return characterInfo.map((characters)=> Character.fromjson(characters)).toList();
  }
}
