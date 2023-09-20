import 'package:equatable/equatable.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';

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
  final TopRepositories loadedTopRepositories;
  HomeLoadedState(this.loadedTopRepositories);
  @override
  List<Object?> get props => [];
}
class HomeErrorState extends HomeState {
  final String msg;
  HomeErrorState(this.msg);
  @override
  List<Object?> get props => [];
}