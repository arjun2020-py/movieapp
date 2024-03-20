part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ShowListState extends HomeState {
  final List<ShowModel> shows;
  ShowListState({required this.shows});
}
