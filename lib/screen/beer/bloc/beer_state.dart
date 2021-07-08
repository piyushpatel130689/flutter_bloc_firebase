part of 'beer_bloc.dart';

abstract class BeerState extends Equatable {
  const BeerState();

  @override
  List<Object> get props => [];
}

class BeerInitialState extends BeerState {
  const BeerInitialState();
}

class BeerLoadingState extends BeerState {
  final String message;

  const BeerLoadingState({
    required this.message,
  });
}

class BeerSuccessState extends BeerState {
  final List<BeerModel> beers;

  const BeerSuccessState({
    required this.beers,
  });
}

class BeerErrorState extends BeerState {
  final String error;

  const BeerErrorState({
    required this.error,
  });
}
