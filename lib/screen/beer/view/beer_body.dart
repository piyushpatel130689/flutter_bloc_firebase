import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class BeerBody extends StatefulWidget {
  @override
  _BeerBodyState createState() => _BeerBodyState();
}

class _BeerBodyState extends State<BeerBody> {
  final _scrollController = ScrollController();
  late BeerBloc _beerBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _beerBloc = context.read<BeerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerBloc, BeerState>(
      builder: (context, state) {
        switch (state.status) {
          case BeerStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case BeerStatus.success:
            if (state.beers.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.beers.length
                    ? BottomLoader()
                    : BeerListItem(beer: state.beers[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.beers.length
                  : state.beers.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _beerBloc.add(FetchBeerEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
