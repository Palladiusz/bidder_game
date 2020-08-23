part of 'play_bloc.dart';

@immutable
abstract class PlayStateBase {
  final int coins;

  PlayStateBase(this.coins);
}

//TODO Review: Dodałem nowy stan, bo jest to lepsze niz dodawanie zmienniej w serwisie isPlaying..
//TODO Review: Jak to przeczytasz to zglos sie do mnie bo mam watpliwosci czy rozumiesz jak zachowują się obiekty..
class PlayLoadingState extends PlayStateBase {
  PlayLoadingState(int coins) : super(coins);
}

class PlayState extends PlayStateBase {
  PlayState(int coins) : super(coins);
}
