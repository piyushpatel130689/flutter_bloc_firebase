import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:piyush_flutter_bloc/data/models/beer_model.dart';
import 'package:piyush_flutter_bloc/data/repositories/beer_repository.dart';

part 'beer_event.dart';

part 'beer_state.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository beerRepository;
  int page = 1;
  bool isFetching = false;

  BeerBloc({
    required this.beerRepository,
  }) : super(BeerInitialState());

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if (event is BeerFetchEvent) {
      yield BeerLoadingState(message: 'Loading Beers');
      isFetching = true;

      try {
        List<BeerModel> beers = await beerRepository.fetchBeers(page: page);
        yield BeerSuccessState(beers: beers);
        isFetching = false;
        page++;
      } catch (e) {
        yield BeerErrorState(error: e.toString());
        isFetching = false;
      }
    }
  }
}
