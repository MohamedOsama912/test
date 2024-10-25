import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed/business_logic/characters_cubit.dart';
import '../../data/model/character.dart';
import '../widgets/loaded_character.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getCharacter();
  }

  Widget BuildBlockWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return BuildLoadedWidget(
              allCharacters: allCharacters); // search for it
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.orange,
          )); // Show loading indicator
        }
      },
    );
  }

  Widget buildSearchCharacter() {
    return TextField(
        controller: searchTextController,
        cursorColor: Colors.orange,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Find The Character... ',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        style: const TextStyle(color: Colors.grey, fontSize: 18),
        onChanged: (text) {
          SearchForCharacter(text);
        });
  }

  void SearchForCharacter(String text) {
    searchedCharacters = allCharacters
        .where(
          (character) => character.name.startsWith(text),
        )
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear)),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            startSearch();
          },
        ),
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    isSearching = false;
    setState(() {});
  }

  void clearSearch() {
    searchTextController.clear();
  }

  Widget AppBarTile() {
    return const Text(
      'Characters',
      style: TextStyle(color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF9D3D),
        title: isSearching ? buildSearchCharacter() : AppBarTile(),
        actions: buildAppBarActions(),
      ),
      body: BuildBlockWidget(),
    );
  }
}
