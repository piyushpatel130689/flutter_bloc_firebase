part of 'beer_bloc.dart';

enum BeerStatus { initial, success, failure }

class BeerState extends Equatable {
  const BeerState({
    this.status = BeerStatus.initial,
    this.beers = const <BeerModel>[],
    this.hasReachedMax = false,
  });

  final BeerStatus status;
  final List<BeerModel> beers;
  final bool hasReachedMax;

  BeerState copyWith({
    BeerStatus? status,
    List<BeerModel>? beers,
    bool? hasReachedMax,
  }) {
    return BeerState(
      status: status ?? this.status,
      beers: beers ?? this.beers,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${beers.length} }''';
  }

  @override
  List<Object> get props => [status, beers, hasReachedMax];
}
