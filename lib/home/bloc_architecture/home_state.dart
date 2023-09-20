import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}
class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}
class HomeLoadedState extends HomeState {
  @override
  List<Object?> get props => [];
}
class HomeErrorState extends HomeState {
  @override
  List<Object?> get props => [];
}