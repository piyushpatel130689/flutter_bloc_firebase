part of 'beer_bloc.dart';

abstract class BeerEvent extends Equatable {
  const BeerEvent();

  @override
  List<Object> get props => [];
}

class BeerFetchEvent extends BeerEvent {
  const BeerFetchEvent();
}
