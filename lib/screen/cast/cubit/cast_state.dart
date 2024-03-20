part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}
class CastListState extends CastState {
  final List<CastModel> casts;
  CastListState({required this.casts});
}