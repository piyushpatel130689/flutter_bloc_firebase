import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:piyush_flutter_bloc/lib.dart';

part 'beer_event.dart';

part 'beer_state.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository beerRepository;
  int page = 1;

  BeerBloc({
    required this.beerRepository,
  }) : super(BeerState());

  // @override
  // Stream<Transition<BeerEvent, BeerState>> transformEvents(
  //     Stream<BeerEvent> events,
  //     TransitionFunction<BeerEvent, BeerState> transitionFn,
  //     ) {
  //   return super.transformEvents(
  //     events.debounceTime(const Duration(milliseconds: 500)),
  //     transitionFn,
  //   );
  // }

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if (event is FetchBeerEvent) {
      yield await _mapBeerFetchedToState(state);
    }
    // if (event is BeerFetchEvent) {
    //   yield BeerLoadingState(message: 'Loading Beers');
    //   isFetching = true;
    //
    //   try {
    //     List<BeerModel> beers = await beerRepository.fetchBeers(page: page);
    //     yield BeerSuccessState(beers: beers);
    //     isFetching = false;
    //     page++;
    //   } catch (e) {
    //     yield BeerErrorState(error: e.toString());
    //     isFetching = false;
    //   }
    // }
  }

  Future<BeerState> _mapBeerFetchedToState(BeerState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == BeerStatus.initial) {
        List<BeerModel> beers = await beerRepository.fetchBeers(page: page);
        page++;
        return state.copyWith(
          status: BeerStatus.success,
          beers: beers,
          hasReachedMax: false,
        );
      }
      final List<BeerModel> beers = await beerRepository.fetchBeers(page: page);
      page++;
      return beers.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: BeerStatus.success,
              beers: List.of(state.beers)..addAll(beers),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: BeerStatus.failure);
    }
  }
}
