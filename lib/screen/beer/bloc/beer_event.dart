part of 'beer_bloc.dart';

abstract class BeerEvent extends Equatable {
  const BeerEvent();

  @override
  List<Object> get props => [];
}

class FetchBeerEvent extends BeerEvent {
  const FetchBeerEvent();
}
