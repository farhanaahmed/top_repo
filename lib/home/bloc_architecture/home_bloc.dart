import 'package:bloc/bloc.dart';
import 'package:top_repo/home/bloc_architecture/home_event.dart';
import 'package:top_repo/home/bloc_architecture/home_state.dart';
import 'package:top_repo/home/home_data/home_data_source.dart';
import 'package:top_repo/home/home_data/top_repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeEmptyState()) {
    on<HomeFetchDataEvent>(_onHomeFetchDataEvent);
  }

  final HomeDataSource _homeDataSource = HomeDataSource();

  void _onHomeFetchDataEvent(HomeFetchDataEvent event, emit) async {
    emit(HomeLoadingState());
    try {
      final TopRepositories topRepositories =
          await _homeDataSource.getRepos(event.topic, 10);
      emit(HomeLoadedState(topRepositories));
    } catch (e) {
      print(e);
      emit(HomeErrorState(e.toString()));
    }
  }
}
