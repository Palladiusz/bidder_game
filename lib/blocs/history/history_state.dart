part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {}

class HistoryLoadedState extends HistoryState {
  final List<RecordCard> items;

  HistoryLoadedState(this.items);

  @override
  List<Object> get props => [items];
}
