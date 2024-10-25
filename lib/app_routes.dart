import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed/business_logic/characters_cubit.dart';
import 'package:omar_ahmed/data/repo/character_repo.dart';
import 'package:omar_ahmed/presentation/screens/characters.dart';
import 'package:omar_ahmed/presentation/screens/characters_details.dart';
import 'constants.dart';
import 'data/web_service/character_web_service.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepo = CharacterRepo(CharcacterService());
    charactersCubit = CharactersCubit(characterRepo);
  }

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetails:
        return MaterialPageRoute(builder: (_) => CharacterDetails());
    }
  }
}
