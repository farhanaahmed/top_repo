abstract class HomeEvent {}

class HomeFetchDataEvent extends HomeEvent {
  final String topic;

  HomeFetchDataEvent(this.topic);
}
